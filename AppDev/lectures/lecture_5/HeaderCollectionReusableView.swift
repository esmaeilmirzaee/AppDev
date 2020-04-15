//
//  HeaderCollectionReusableView.swift
//  AppDev
//
//  Created by Esmaeil MIRZAEE on 2020-04-11.
//  Copyright © 2020 TheBeaver. All rights reserved.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
    var label: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Header"
        label.textColor = .white
        label.textAlignment = .center
        label.backgroundColor = .darkGray
        addSubview(label)
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
