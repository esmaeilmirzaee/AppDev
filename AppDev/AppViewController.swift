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

    var lecturesButton: UIButton!
    var practiseButton: UIButton!
    var handoutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = UIColor(red: 0.15, green: 0.10, blue: 0.20, alpha: 1)
        title = "Cornell AppDev iOS Training"
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage.init(systemName: "info"), style: .done, target: self, action: #selector(infoAppSelector))
        
        lecturesButton = UIButton()
        lecturesButton.translatesAutoresizingMaskIntoConstraints = false
        lecturesButton.setTitle("Courses", for: .normal)
        lecturesButton.setTitleColor(.black, for: .normal)
        lecturesButton.backgroundColor = .systemFill
        lecturesButton.layer.cornerRadius  = 10
        lecturesButton.addTarget(self, action: #selector(lectureThreeButtonPressed), for: .touchUpInside)
        view.addSubview(lecturesButton)
        
        practiseButton = UIButton()
        practiseButton.translatesAutoresizingMaskIntoConstraints = false
        practiseButton.setTitle("Practise", for: .normal)
        practiseButton.setTitleColor(.black, for: .normal)
        practiseButton.backgroundColor = .systemTeal
        practiseButton.layer.cornerRadius = 10
        practiseButton.addTarget(self, action: #selector(practiseViewControllerFunc), for: .touchUpInside)
        view.addSubview(practiseButton)
        
        handoutButton = UIButton()
        handoutButton.translatesAutoresizingMaskIntoConstraints = false
        handoutButton.setTitle("Handouts", for: .normal)
        handoutButton.layer.borderColor = .init(srgbRed: 1.00000, green: 1.0000, blue: 1.00000, alpha: 1.0000)
        handoutButton.backgroundColor = .systemGray
        handoutButton.layer.cornerRadius = 10
        handoutButton.layer.borderWidth = 1
        handoutButton.setTitleShadowColor(.gray, for: .normal)
        
        handoutButton.addTarget(self, action: #selector(openHandouts), for: .touchUpInside)
        view.addSubview(handoutButton)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            lecturesButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            lecturesButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            lecturesButton.widthAnchor.constraint(equalToConstant: 180),
            lecturesButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            practiseButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            practiseButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            practiseButton.widthAnchor.constraint(equalToConstant: 180),
            practiseButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            handoutButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            handoutButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            handoutButton.widthAnchor.constraint(equalToConstant: 180),
            handoutButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    @objc func infoAppSelector() {
        let informationAppViewController = LectureTwoMainViewController()
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
