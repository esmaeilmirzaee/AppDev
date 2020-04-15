//
//  CourseMainViewController.swift
//  AppDev
//
//  Created by Esmaeil MIRZAEE on 2020-04-08.
//  Copyright © 2020 TheBeaver. All rights reserved.
//

import UIKit

class LectureFourViewController: UIViewController {
    
    var tableView: UITableView!
    var cafeterias: [Cafeteria]!
    
    let reuseIdentifier = "cafetriaCellReuse"
    let cellHeight: CGFloat = 50
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Lecture 4"
        view.backgroundColor = .white
        
        let appel = Cafeteria(name: "Appel", rating: .not_tested_yet, isFavourite: false)
        let rpcc = Cafeteria(name: "RPCC", rating: .moderate, isFavourite: false)
        let risley = Cafeteria(name: "Risley", rating: .bad, isFavourite: false)
        let beker = Cafeteria(name: "Beker", rating: .great, isFavourite: false)
        let cook = Cafeteria(name: "Cook", rating: .good, isFavourite: true)
        
        cafeterias = [appel, rpcc, risley, beker, cook]
        
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints  = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CafeterialTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        view.addSubview(tableView)
        
        setupConstraint()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setupConstraint() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}

extension LectureFourViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cafeterias.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! CafeterialTableViewCell
        cell.configure(for: cafeterias[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
}

extension LectureFourViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! CafeterialTableViewCell
        let cafeteria = cafeterias[indexPath.row]
        cafeteria.isFavourite.toggle()
        cell.heartToggled(for: cafeteria.isFavourite)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print("Deselected")
    }
}
