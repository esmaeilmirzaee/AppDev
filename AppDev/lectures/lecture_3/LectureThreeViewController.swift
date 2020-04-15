//
//  LectureThreeViewController.swift
//  AppDev
//
//  Created by Esmaeil MIRZAEE on 2020-04-07.
//  Copyright © 2020 TheBeaver. All rights reserved.
//

import UIKit

class LectureThreeViewController: UIViewController {

    
    var pushNavViewControllerButton: UIButton!
    var presentModelViewControllerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Lecture Three"
        view.backgroundColor = .white
        
        pushNavViewControllerButton = UIButton()
        pushNavViewControllerButton.translatesAutoresizingMaskIntoConstraints = false
        pushNavViewControllerButton.setTitle("Push Navigation VC", for: .normal)
        pushNavViewControllerButton.backgroundColor = .white
        pushNavViewControllerButton.setTitleColor(UIColor(red: 0.01, green: 0.0, blue: 0.6, alpha: 1), for: .normal)
        pushNavViewControllerButton.addTarget(self, action: #selector(pushNavViewControllerButtonPressed), for: .touchUpInside)
        view.addSubview(pushNavViewControllerButton)
        
        presentModelViewControllerButton = UIButton()
        presentModelViewControllerButton.translatesAutoresizingMaskIntoConstraints = false
        presentModelViewControllerButton.setTitle("Present Modal View Controller", for: .normal)
        presentModelViewControllerButton.backgroundColor = .white
        presentModelViewControllerButton.setTitleColor(.black, for: .normal)
        presentModelViewControllerButton.addTarget(self, action: #selector(modelViewControllerButtonPressed), for: .touchUpInside)
        view.addSubview(presentModelViewControllerButton)
        
        setupConstraints()
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            pushNavViewControllerButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            pushNavViewControllerButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            pushNavViewControllerButton.widthAnchor.constraint(equalToConstant: 200),
            pushNavViewControllerButton.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        NSLayoutConstraint.activate([
            presentModelViewControllerButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            presentModelViewControllerButton.topAnchor.constraint(equalTo: pushNavViewControllerButton.bottomAnchor, constant: 10),
            presentModelViewControllerButton.widthAnchor.constraint(equalToConstant: 250),
            presentModelViewControllerButton.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
    
    @objc func pushNavViewControllerButtonPressed() {
        let pushNavViewController = PushViewController()
        navigationController?.pushViewController(pushNavViewController, animated: true)
    }
    
    @objc func modelViewControllerButtonPressed() {
        
        let modelViewController = ModalViewController(placeHolder: presentModelViewControllerButton.title(for: .normal)!)
        modelViewController.delegate = self
        present(modelViewController, animated: true, completion: nil)
    }
}

extension LectureThreeViewController: ChangeViewControllerButtonDelegate {
    func textFieldTextChanged(to newString: String) {
        presentModelViewControllerButton.setTitle(newString, for: .normal)
    }
}
