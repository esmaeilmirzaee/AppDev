//
//  AddFriendViewController.swift
//  AppDev
//
//  Created by Esmaeil MIRZAEE on 2020-04-13.
//  Copyright © 2020 TheBeaver. All rights reserved.
//

import UIKit
import Firebase

class AddFriendViewController: UIViewController {
    var searchBar: UISearchBar!
    var resultsTableView: UITableView!
    
    var results = [String]()
    
    let resultsReuseIdentifier = "results"
    let cellHeight: CGFloat = 50
    let searchBarHeight: CGFloat = 50
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Add friend"
        view.backgroundColor = .white
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelButtonSelector))
        
        setupViews()
        setupConstraints()
    }
    
    @objc func cancelButtonSelector() {
        dismiss(animated: true, completion: nil)
    }
    
    func setupViews() {
        searchBar = UISearchBar()
        searchBar.delegate = self
        searchBar.backgroundColor = .white
        searchBar.placeholder = "Search by username"
        searchBar.barStyle = .default
        view.addSubview(searchBar)
        
        resultsTableView = UITableView()
        resultsTableView.dataSource = self
        resultsTableView.register(ResultTableViewCell.self, forCellReuseIdentifier: resultsReuseIdentifier)
        resultsTableView.tableFooterView = UIView()
        resultsTableView.rowHeight = cellHeight
        view.addSubview(resultsTableView)
    }
    
    func setupConstraints() {
        searchBar.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalTo(searchBarHeight)
            make.top.equalToSuperview().offset(navigationController!.navigationBar.frame.height + UIApplication.shared.statusBarFrame.height)
        }
        
        resultsTableView.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.top.equalTo(searchBar.snp.bottom)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
    
    func update(with results: [String]) {
        self.results = results
        resultsTableView.reloadData()
    }
    
    func search(with input: String) {
        DatabaseManager.findUsers(input: input) { (users) in
            DispatchQueue.main.async {
                self.update(with: users)
            }
        }
    }
}

extension AddFriendViewController: ResultTableViewCellDelegate {
    func resultTableViewCellDidTapAddButton(result: String) {
        DatabaseManager.addFriend(friend: result) { (didCreate) in
            if didCreate {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
}

extension AddFriendViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let text = searchBar.text, !text.isEmpty else { return }
        search(with: text)
    }
}


extension AddFriendViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = resultsTableView.dequeueReusableCell(withIdentifier: resultsReuseIdentifier, for: indexPath) as! ResultTableViewCell
        let result = results[indexPath.row]
        cell.configure(with: result, delegate: self)
        cell.selectionStyle = .none
        return cell
    }
}
