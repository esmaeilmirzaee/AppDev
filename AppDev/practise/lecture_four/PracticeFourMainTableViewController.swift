//
//  PracticeFourMainTableViewController.swift
//  AppDev
//
//  Created by Esmaeil MIRZAEE on 2020-04-10.
//  Copyright © 2020 TheBeaver. All rights reserved.
//

import UIKit

class PracticeFourMainTableViewController: UIViewController {

    var tableView: UITableView!
    let reuseIdentifier: String = "cafeteriaReuseIdentifier"
    let cellHeight: CGFloat = 300

    var cafeterias: [PracticeCafeteria]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Cafeteria Rating"
        view.backgroundColor = .white
        
        let appel = PracticeCafeteria(name: "Appel", rating: .bad)
        let rpcc = PracticeCafeteria(name: "RPCC", rating: .best)
        let risley = PracticeCafeteria(name: "Risley", rating: .good)
        let becker = PracticeCafeteria(name: "Becker", rating: .moderate)
        let cook = PracticeCafeteria(name: "Cook", rating: .terrible)
        
        cafeterias = [appel, rpcc, risley, becker, cook]
        
        
        
        
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(PracticeCafeteriaTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        
        setupConstraint()
    }
    
    func setupConstraint() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0)
        ])
    }
}

extension PracticeFourMainTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cafeterias.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! PracticeCafeteriaTableViewCell
        cell.configureUICell(for: cafeterias[indexPath.row])
        
        return cell
    }
}

extension PracticeFourMainTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
    }
}
