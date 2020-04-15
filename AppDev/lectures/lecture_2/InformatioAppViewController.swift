//
//  ViewController.swift
//  AppDev
//
//  Created by Esmaeil MIRZAEE on 2020-04-07.
//  Copyright © 2020 TheBeaver. All rights reserved.
//

import UIKit

class InformatioAppViewController: UIViewController {

    var imageView: UIImageView!
    var nameButton: UIButton!
    var descriptionTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(displayP3Red: 0.10, green: 0.10, blue: 0.15, alpha: 1.0)
        title = "Info"
        
        imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "thebeaver")
        view.addSubview(imageView)
        
        nameButton = UIButton()
        nameButton.translatesAutoresizingMaskIntoConstraints = false
        nameButton.setTitle("The Beaver", for: .normal)
        nameButton.backgroundColor = .black
        nameButton.setTitleColor(.white, for: .normal)
        nameButton.addTarget(self, action: #selector(nameButtonPressed), for: .touchUpInside)
        view.addSubview(nameButton)
        
        descriptionTextView = UITextView()
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        descriptionTextView.text = "The Beaver is the leading technology company. It is speciallised in Software and Hardware development."
        descriptionTextView.backgroundColor = .white
        descriptionTextView.font = UIFont.systemFont(ofSize: 14)
        descriptionTextView.isEditable = false
        descriptionTextView.isSelectable = false
        view.addSubview(descriptionTextView)
        
        setupConstraints()
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            imageView.widthAnchor.constraint(equalToConstant: 64),
            imageView.heightAnchor.constraint(equalToConstant: 64)
        ])
        
        NSLayoutConstraint.activate([
            nameButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            nameButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            nameButton.widthAnchor.constraint(equalToConstant: 120),
            nameButton.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        NSLayoutConstraint.activate([
            descriptionTextView.topAnchor.constraint(equalTo: nameButton.bottomAnchor, constant: 20),
            descriptionTextView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            descriptionTextView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            descriptionTextView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            descriptionTextView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8)
        ])
        
    }
    
    @objc func nameButtonPressed() {
        if nameButton.currentTitleColor == .white {
            nameButton.setTitleColor(.black, for: .normal)
            nameButton.backgroundColor = .white
            descriptionTextView.backgroundColor = UIColor(red: 0.10, green: 0.10, blue: 0.10, alpha: 1)
            descriptionTextView.textColor = .white
        } else {
            nameButton.setTitleColor(.white, for: .normal)
            nameButton.backgroundColor = .black
            descriptionTextView.backgroundColor = .white
            descriptionTextView.textColor = .black
        }
        
    }
}

