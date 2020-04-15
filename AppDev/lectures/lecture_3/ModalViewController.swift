//
//  ModelViewController.swift
//  AppDev
//
//  Created by Esmaeil MIRZAEE on 2020-04-07.
//  Copyright © 2020 TheBeaver. All rights reserved.
//

import UIKit

protocol ChangeViewControllerButtonDelegate: class {
    func textFieldTextChanged(to newString: String)
}

class ModalViewController: UIViewController {

    var button: UIButton!
    var textField: UITextField!
    var placeHolder: String
    
    init(placeHolder: String) {
        self.placeHolder = placeHolder
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    weak var delegate: ChangeViewControllerButtonDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Model View Controller"
        view.backgroundColor = .white
        
        textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.text = placeHolder
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .white
        textField.textAlignment = .center
        textField.clearsOnBeginEditing = true
        
        view.addSubview(textField)
        
        button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Dissmiss and save text.", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.red, for: .normal)
        button.addTarget(self, action: #selector(dismissViewControllerAndSaveText), for: .touchUpInside)
        
        view.addSubview(button)
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            textField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            textField.heightAnchor.constraint(equalToConstant: 24)
        ])
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 16),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    @objc func dismissViewControllerAndSaveText() {
        if let text = textField.text, text != "" {
            delegate?.textFieldTextChanged(to: text)
            dismiss(animated: true, completion: nil)
        } else {
            dismiss(animated: true, completion: nil)
        }
    }
}
