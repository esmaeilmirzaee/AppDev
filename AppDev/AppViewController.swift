//
//  AppViewController.swift
//  AppDev
//
//  Created by Esmaeil MIRZAEE on 2020-04-07.
//  Copyright © 2020 TheBeaver. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn


class AppViewController: UIViewController {

    
    var informationAppViewControllerButton: UIButton!
    var lecturesButton: UIButton!
    var practiseButton: UIButton!
    var handoutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = UIColor(red: 0.15, green: 0.10, blue: 0.20, alpha: 1)
        title = "Cornell AppDev iOS Training"
        view.backgroundColor = .white
        
        
        informationAppViewControllerButton = UIButton()
        informationAppViewControllerButton.translatesAutoresizingMaskIntoConstraints = false
//        informationAppViewControllerButton.setImage(UIImage.init(systemName: "info"), for: .normal)
        informationAppViewControllerButton.setImage(UIImage(systemName: "info"), for: .normal)
        informationAppViewControllerButton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        informationAppViewControllerButton.setTitleShadowColor(.white, for: .normal)
        informationAppViewControllerButton.setTitleColor(.white, for: .normal)
        informationAppViewControllerButton.layer.cornerRadius = 15
        informationAppViewControllerButton.clipsToBounds = true
        informationAppViewControllerButton.layer.borderWidth = 1.0
        informationAppViewControllerButton.layer.borderColor = .init(srgbRed: 1.0, green: 1.0, blue: 1.0, alpha: 1)
        informationAppViewControllerButton.backgroundColor = .clear
        informationAppViewControllerButton.addTarget(self, action: #selector(informationAppViewControllerButtonPressed), for: .touchUpInside)
        view.addSubview(informationAppViewControllerButton)
        
        lecturesButton = UIButton()
        lecturesButton.translatesAutoresizingMaskIntoConstraints = false
        lecturesButton.setTitle("Courses", for: .normal)
        lecturesButton.setTitleColor(.black, for: .normal)
        lecturesButton.backgroundColor = .white
        lecturesButton.addTarget(self, action: #selector(lectureThreeButtonPressed), for: .touchUpInside)
        view.addSubview(lecturesButton)
        
        practiseButton = UIButton()
        practiseButton.translatesAutoresizingMaskIntoConstraints = false
        practiseButton.setTitle("Practise", for: .normal)
        practiseButton.setTitleColor(.black, for: .normal)
        practiseButton.backgroundColor = .white
        practiseButton.addTarget(self, action: #selector(practiseViewControllerFunc), for: .touchUpInside)
        view.addSubview(practiseButton)
        
        handoutButton = UIButton()
        handoutButton.translatesAutoresizingMaskIntoConstraints = false
        handoutButton.setTitle("Handouts", for: .normal)
//        handoutButton.showsTouchWhenHighlighted = true
        handoutButton.layer.borderColor = .init(srgbRed: 1.00000, green: 1.0000, blue: 1.00000, alpha: 1.0000)
        handoutButton.layer.cornerRadius = 0.7
        handoutButton.layer.borderWidth = 1
        handoutButton.setTitleShadowColor(.gray, for: .normal)
//        handoutButton.contentEdgeInsets = UIEdgeInsets(top: -10, left: -1, bottom: -1, right: -1)
        
        handoutButton.addTarget(self, action: #selector(openHandouts), for: .touchUpInside)
        view.addSubview(handoutButton)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            informationAppViewControllerButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            informationAppViewControllerButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            informationAppViewControllerButton.widthAnchor.constraint(equalToConstant: 30),
            informationAppViewControllerButton.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            lecturesButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            lecturesButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            lecturesButton.widthAnchor.constraint(equalToConstant: 120),
            lecturesButton.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        NSLayoutConstraint.activate([
            practiseButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            practiseButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            practiseButton.widthAnchor.constraint(equalToConstant: 94),
            practiseButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            handoutButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            handoutButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            handoutButton.widthAnchor.constraint(equalToConstant: 100),
            handoutButton.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
    
    @objc func informationAppViewControllerButtonPressed() {
        let informationAppViewController = InformatioAppViewController()
        navigationController?.pushViewController(informationAppViewController, animated: true)
    }
    
    @objc func lectureThreeButtonPressed() {
        let lecturesMainViewController = LecturesMainViewController()
        navigationController?.pushViewController(lecturesMainViewController, animated: true)
    }
    
    @objc func practiseViewControllerFunc() {
        let practicesMainViewController = PracticeMainViewController()
        navigationController?.pushViewController(practicesMainViewController, animated: true)
    }

    @objc func openHandouts() {
        let handoutsViewController = HandoutsViewController()
        navigationController?.pushViewController(handoutsViewController, animated: true)
    }
}
