//
//  ProjectTwoMainViewController.swift
//  AppDev
//
//  Created by Esmaeil MIRZAEE on 2020-04-08.
//  Copyright © 2020 TheBeaver. All rights reserved.
//

import UIKit

class ProjectTwoMainViewController: UIViewController {
    
    var groceryItemTextField: UITextField!
    var groceryItemLabel: UILabel!
    var quantityItemTextField: UITextField!
    var quantityItemLabel: UILabel!
    var addItemButton: UIButton!
    var listItemLabel: UILabel!
    var listItemTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Project Two"
        view.backgroundColor = .white
        
        groceryItemTextField = UITextField()
        groceryItemTextField.translatesAutoresizingMaskIntoConstraints = false
        groceryItemTextField.textAlignment = .left
        groceryItemTextField.textColor = .white
        groceryItemTextField.layer.borderColor = .init(srgbRed: 0.02, green: 0.02, blue: 0.02, alpha: 1)
        groceryItemTextField.layer.borderWidth = 0.1
        groceryItemTextField.backgroundColor = .lightGray

        view.addSubview(groceryItemTextField)
        
        groceryItemLabel = UILabel()
        groceryItemLabel.translatesAutoresizingMaskIntoConstraints = false
        groceryItemLabel.text = "Grocery Item:"
        groceryItemLabel.textColor = .darkGray
        groceryItemLabel.textAlignment = .right
        
        view.addSubview(groceryItemLabel)
        
        quantityItemTextField = UITextField()
        quantityItemTextField.translatesAutoresizingMaskIntoConstraints = false
        quantityItemTextField.textAlignment = .left
        quantityItemTextField.textColor = .black
        quantityItemTextField.layer.borderColor = .init(srgbRed: 0.02, green: 0.02, blue: 0.02, alpha: 1)
        quantityItemTextField.layer.borderWidth = 0.1
        quantityItemTextField.backgroundColor = .lightGray
        
        view.addSubview(quantityItemTextField)
        
        quantityItemLabel = UILabel()
        quantityItemLabel.translatesAutoresizingMaskIntoConstraints = false
        quantityItemLabel.text = "Quantity:"
        quantityItemLabel.textColor = .darkGray
        quantityItemLabel.textAlignment = .right
        
        view.addSubview(quantityItemLabel)
        
        addItemButton = UIButton()
        addItemButton.translatesAutoresizingMaskIntoConstraints = false
        addItemButton.setTitle("Add item", for: .normal)
        addItemButton.setTitleColor(.systemBlue, for: .normal)
        addItemButton.backgroundColor = .clear
        addItemButton.addTarget(self, action: #selector(addItemButtonSelector), for: .touchUpInside)
        view.addSubview(addItemButton)
        
        listItemLabel = UILabel()
        listItemLabel.translatesAutoresizingMaskIntoConstraints = false
        listItemLabel.text = "Grocery List"
        listItemLabel.textColor = .black
        
        view.addSubview(listItemLabel)
        
        listItemTextView = UITextView()
        listItemTextView.translatesAutoresizingMaskIntoConstraints = false
        listItemTextView.textAlignment = .center
        listItemTextView.textColor = .black
        listItemTextView.layer.borderWidth = 1
        listItemTextView.layer.borderColor = .init(srgbRed: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        
        view.addSubview(listItemTextView)
        
        setupConstraint()
    }
    
    func setupConstraint() {
        
        NSLayoutConstraint.activate([
            groceryItemTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            groceryItemTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -32),
            groceryItemTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            groceryItemLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            groceryItemLabel.trailingAnchor.constraint(equalTo: groceryItemTextField.leadingAnchor, constant: -8)
        ])
        
        NSLayoutConstraint.activate([
            quantityItemTextField.topAnchor.constraint(equalTo: groceryItemTextField.bottomAnchor, constant: 8),
            quantityItemTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -32),
            quantityItemTextField.leadingAnchor.constraint(equalTo: groceryItemTextField.leadingAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            quantityItemLabel.topAnchor.constraint(equalTo: groceryItemLabel.bottomAnchor, constant: 8),
            quantityItemLabel.trailingAnchor.constraint(equalTo: quantityItemTextField.leadingAnchor, constant: -8)
        ])
        
        NSLayoutConstraint.activate([
            addItemButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            addItemButton.topAnchor.constraint(equalTo: quantityItemLabel.bottomAnchor, constant: 32)
        ])
        
        NSLayoutConstraint.activate([
            listItemLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            listItemLabel.topAnchor.constraint(equalTo: addItemButton.bottomAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            listItemTextView.topAnchor.constraint(equalTo: listItemLabel.bottomAnchor, constant: 8),
            listItemTextView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            listItemTextView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            listItemTextView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8)
        ])
    }
    
    @objc func addItemButtonSelector() {
        if let groceryText = groceryItemTextField.text, groceryText != "" {
            if let quantityText = quantityItemTextField.text, quantityText != "" {
                listItemTextView.text = listItemTextView.text + "\n\(groceryText) \(quantityText)"
            } else {
                listItemLabel.textColor = .systemRed
                listItemLabel.text = "Please add quantity"
            }
        } else {
            listItemLabel.textColor = .systemRed
            listItemLabel.text = "Please add grocery item"
        }

    }
}
