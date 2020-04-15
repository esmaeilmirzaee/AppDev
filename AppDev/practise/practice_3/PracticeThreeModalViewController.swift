//
//  PractiseNavViewController.swift
//  AppDev
//
//  Created by Esmaeil MIRZAEE on 2020-04-07.
//  Copyright © 2020 TheBeaver. All rights reserved.
//

import UIKit

protocol ModalViewControllerDelegate: class {
    func placeHolderText(to newString: String)
}

class PracticeThreeModalViewController: UIViewController {

    var textField: UITextField!
    var button: UIButton!
    var placeHolder: String
    
    weak var delegate: ModalViewControllerDelegate?
    
    init(placeHolder: String) {
        self.placeHolder = placeHolder
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Lecture 3 - Practise"
        view.backgroundColor = .white
        
        textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .white
        textField.textColor = UIColor(red: 0.20, green: 0.20, blue: 0.20, alpha: 1)
        textField.text = placeHolder
        textField.borderStyle = .roundedRect
        textField.textAlignment = .center
        textField.clearsOnBeginEditing = true
        
        view.addSubview(textField)
        
        button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(red: 0, green: 0.1, blue: 0.4, alpha: 1)
        button.setTitle("Dismiss and save text", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(saveAndDismissText), for: .touchUpInside)
        
        view.addSubview(button)
        
        setupConstraint()
    }
    
    func setupConstraint() {
        NSLayoutConstraint.activate([
        textField.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
        textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
        textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
        textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
        textField.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            button.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 8)
        ])
    }
    
    @objc func saveAndDismissText() {
        if let text = textField.text, text != "" {
            delegate?.placeHolderText(to: text)
            dismiss(animated: true, completion: nil)
        } else {
            dismiss(animated: true, completion: nil)
        }
    }

}
