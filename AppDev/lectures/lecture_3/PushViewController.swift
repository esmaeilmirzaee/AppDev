//
//  PushViewController.swift
//  AppDev
//
//  Created by Esmaeil MIRZAEE on 2020-04-07.
//  Copyright © 2020 TheBeaver. All rights reserved.
//

import UIKit

class PushViewController: UIViewController {
    
    var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Push View Controller"
        let arrayColour = [UIColor.systemBlue, UIColor.systemRed, UIColor.systemGreen]
        let colourPicker = Int(arc4random() % 3)
        print(colourPicker)
        view.backgroundColor = arrayColour[colourPicker]
        
        label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        label.text = "Welcome"
        label.textAlignment = .center
        label.shadowColor = .white
        label.shadowOffset = .init(width: 1, height: 1)
        
        view.addSubview(label)
        setupConstraint()
    }
    
    func setupConstraint() {
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8)
        ])
    }
}
