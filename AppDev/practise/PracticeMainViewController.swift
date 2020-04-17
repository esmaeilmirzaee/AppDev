//
//  PracticesMainViewController.swift
//  AppDev
//
//  Created by Esmaeil MIRZAEE on 2020-04-09.
//  Copyright © 2020 TheBeaver. All rights reserved.
//

import UIKit

class PracticeMainViewController: UIViewController {

    var noThreeButton: UIButton!
    var noFourButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Practices"
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = false
        
        noThreeButton = UIButton()
        noThreeButton.translatesAutoresizingMaskIntoConstraints = false
        noThreeButton.setTitle("No 3", for: .normal)
        noThreeButton.setTitleColor(.systemBlue, for: .normal)
        noThreeButton.layer.borderColor = .init(srgbRed: 0.3, green: 0.3, blue: 0.7, alpha: 1)
        noThreeButton.layer.borderWidth = 1.0
        noThreeButton.backgroundColor = .clear
        noThreeButton.addTarget(self, action: #selector(noThreeButtonSelector), for: .touchUpInside)
        
        view.addSubview(noThreeButton)
        
        
        noFourButton = UIButton()
        noFourButton.translatesAutoresizingMaskIntoConstraints = false
        noFourButton.setTitle("No 4", for: .normal)
        noFourButton.setTitleColor(.systemBlue, for: .normal)
        noFourButton.layer.borderColor = .init(srgbRed: 0.3, green: 0.3, blue: 0.7, alpha: 1)
        noFourButton.layer.borderWidth = 1.0
        noFourButton.backgroundColor = .clear
        noFourButton.addTarget(self, action: #selector(noFourButtonSelector), for: .touchUpInside)
        
        view.addSubview(noFourButton)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            noThreeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            noThreeButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            noThreeButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            noThreeButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8)
        ])
        
        NSLayoutConstraint.activate([
            noFourButton.topAnchor.constraint(equalTo: noThreeButton.bottomAnchor, constant: 8),
            noFourButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            noFourButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8)
        ])
    }
    
    @objc func noThreeButtonSelector() {
        let practiceThreeMainViewController = PracticeThreeMainViewController()
        navigationController?.pushViewController(practiceThreeMainViewController, animated: true)
    }
    
    @objc func noFourButtonSelector() {
        let practiceFourMainViewController = PracticeFourMainViewController()
        navigationController?.pushViewController(practiceFourMainViewController, animated: true)
    }
}
