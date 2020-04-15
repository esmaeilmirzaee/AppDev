//
//  HandoutsViewController.swift
//  AppDev
//
//  Created by Esmaeil MIRZAEE on 2020-04-07.
//  Copyright © 2020 TheBeaver. All rights reserved.
//

import UIKit

class HandoutsViewController: UIViewController {

    var primaryColour: UIColor = UIColor(red:0.00000, green:0.53405, blue:0.97520, alpha:1.00000)
    var primaryCGColour: CGColor = CGColor(srgbRed: 0.0000, green: 0.53405, blue: 0.97520, alpha: 1.0000)
    var projectOneButton: UIButton!
    var projectTwoButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Handouts"
        view.backgroundColor = .white
        
        projectOneButton = UIButton()
        projectOneButton.translatesAutoresizingMaskIntoConstraints = false
        projectOneButton.setTitle("Project One", for: .normal)
        projectOneButton.setTitleColor(primaryColour, for: .normal)
        projectOneButton.backgroundColor = .clear
        projectOneButton.layer.borderWidth = 1
        projectOneButton.layer.borderColor = CGColor(srgbRed: 0.0000, green: 0.53405, blue: 0.97520, alpha: 1.0000)
        projectOneButton.layer.cornerRadius = 0.7
        
        view.addSubview(projectOneButton)
        
        projectTwoButton = UIButton()
        projectTwoButton.translatesAutoresizingMaskIntoConstraints = false
        projectTwoButton.setTitle("Project Two", for: .normal)
        projectTwoButton.setTitleColor(primaryColour, for: .normal)
        projectTwoButton.backgroundColor = .clear
        projectTwoButton.layer.borderWidth = 1
        projectTwoButton.layer.borderColor = primaryCGColour
        projectTwoButton.layer.cornerRadius = 0.5
        
        projectTwoButton.addTarget(self, action: #selector(projectTwoSelector), for: .touchUpInside)
        
        view.addSubview(projectTwoButton)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            projectOneButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            projectOneButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            projectOneButton.widthAnchor.constraint(equalToConstant: 180)
        ])
        
        NSLayoutConstraint.activate([
            projectTwoButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            projectTwoButton.topAnchor.constraint(equalTo: projectOneButton.bottomAnchor, constant: 8),
            projectTwoButton.widthAnchor.constraint(equalToConstant: 180)
        ])
    }
    
    @objc func projectOne() {
        
    }
    
    @objc func projectTwoSelector() {
        let projectTwoMainViewController = ProjectTwoMainViewController()
        navigationController?.pushViewController(projectTwoMainViewController, animated: true)
    }
}
