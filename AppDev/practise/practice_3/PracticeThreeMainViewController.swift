//
//  PractiseViewController.swift
//  AppDev
//
//  Created by Esmaeil MIRZAEE on 2020-04-07.
//  Copyright © 2020 TheBeaver. All rights reserved.
//

import UIKit

class PracticeThreeMainViewController: UIViewController {

    var practiseViewControllerButton: UIButton!
    var modalViewControllerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Practise Makes Perfect"
        view.backgroundColor = .white
        
        practiseViewControllerButton = UIButton()
        practiseViewControllerButton.translatesAutoresizingMaskIntoConstraints = false
        practiseViewControllerButton.setTitleColor(UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 1.0), for: .normal)
        practiseViewControllerButton.setTitle("Push View Controller", for: .normal)
        practiseViewControllerButton.backgroundColor = .white
        practiseViewControllerButton.addTarget(self, action: #selector(pushViewControllerButtonPressed), for: .touchUpInside)
        view.addSubview(practiseViewControllerButton)
        
        modalViewControllerButton = UIButton()
        modalViewControllerButton.translatesAutoresizingMaskIntoConstraints = false
        modalViewControllerButton.setTitleColor(.red, for: .normal)
        modalViewControllerButton.setTitle("Tap to change my name", for: .normal)
        modalViewControllerButton.backgroundColor = .white
        modalViewControllerButton.addTarget(self, action: #selector(modalViewControllerButtonPressed), for: .touchUpInside)
        view.addSubview(modalViewControllerButton)
        
        setupConstraint()
    }
    
    func setupConstraint() {
        NSLayoutConstraint.activate([
            practiseViewControllerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            practiseViewControllerButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            practiseViewControllerButton.widthAnchor.constraint(equalToConstant: 200),
            practiseViewControllerButton.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        NSLayoutConstraint.activate([
            modalViewControllerButton.widthAnchor.constraint(equalToConstant: 200),
            modalViewControllerButton.heightAnchor.constraint(equalToConstant: 25),
            modalViewControllerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            modalViewControllerButton.topAnchor.constraint(equalTo: practiseViewControllerButton.bottomAnchor, constant: 10)
        ])
    }
    
    @objc func pushViewControllerButtonPressed() {
        let practicePushViewController = PracticeThreePushViewController()
        navigationController?.pushViewController(practicePushViewController, animated: true)
    }
    
    @objc func modalViewControllerButtonPressed() {
        let practiseModalViewController = PracticeThreeModalViewController(placeHolder: modalViewControllerButton.title(for: .normal)!)
        practiseModalViewController.delegate = self
        present(practiseModalViewController, animated: true, completion: nil)
    }
}

extension PracticeThreeMainViewController: ModalViewControllerDelegate {
    func placeHolderText(to newString: String) {
        modalViewControllerButton.setTitle(newString, for: .normal)
    }
    
    
}
