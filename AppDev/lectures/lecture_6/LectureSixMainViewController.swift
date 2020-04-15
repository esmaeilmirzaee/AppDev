//
//  LectureSixMainViewController.swift
//  AppDev
//
//  Created by Esmaeil MIRZAEE on 2020-04-12.
//  Copyright © 2020 TheBeaver. All rights reserved.
//

import UIKit
import SnapKit

class LectureSixMainViewController: UIViewController {

    var tableView: UITableView!
    
    let cellReusableIdentifier = "lectureSixCellReusableIdentifier"
    
    
    var courses: [Course]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        courses = []
        getCourses()
        title = "Lecture 6"
        view.backgroundColor = .white
        
        
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(LectureSixCellTableViewCell.self, forCellReuseIdentifier: cellReusableIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        
        setupConstraints()
    }
    
    func setupConstraints() {
//        NSLayoutConstraint.activate([
//            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
//            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
//            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
//        ])
        tableView.snp.makeConstraints { (make) in
            //2make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            //1 2 make.leading.equalToSuperview()
            //1 2 make.trailing.equalToSuperview()
            //1 2 make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            //1
            // make.top.bottom.leading.equalToSuperview()
            // 2
            make.edges.equalToSuperview()
        }
        
    }
    
    func getCourses() {
        NetworkManager.getClasses { (courses) in
            self.courses = courses
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

extension LectureSixMainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReusableIdentifier, for: indexPath) as! LectureSixCellTableViewCell
        cell.configureCell(for: courses[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

extension LectureSixMainViewController: UITableViewDelegate {
    
}
