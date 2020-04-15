//
//  PractisePushViewController.swift
//  AppDev
//
//  Created by Esmaeil MIRZAEE on 2020-04-07.
//  Copyright © 2020 TheBeaver. All rights reserved.
//

import UIKit

class PracticeThreePushViewController: UIViewController {

    var welcomeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Push View Controller"
        
        let backgroundColour: [UIColor] = [.systemBlue, .systemRed, .systemGray, .systemGreen]
        let random = Int(arc4random() % 4)
        view.backgroundColor = backgroundColour[random]
        
        welcomeLabel = UILabel()
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel.text = "Welcome"
        welcomeLabel.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        welcomeLabel.textAlignment = .center
        welcomeLabel.shadowColor = .white
        welcomeLabel.shadowOffset = CGSize(width: 1, height: 1)
        view.addSubview(welcomeLabel)
        
        setupConstraint()
    }
    
    func setupConstraint() {
        NSLayoutConstraint.activate([
            welcomeLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            welcomeLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            welcomeLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            welcomeLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8)
        ])
    }
}
