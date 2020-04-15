//
//  PersonCollectionViewCell.swift
//  AppDev
//
//  Created by Esmaeil MIRZAEE on 2020-04-11.
//  Copyright © 2020 TheBeaver. All rights reserved.
//

import UIKit

class PersonCollectionViewCell: UICollectionViewCell {
    
    var personImage: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        personImage = UIImageView()
        personImage.translatesAutoresizingMaskIntoConstraints = false
        personImage.contentMode = .scaleAspectFit
        
        contentView.addSubview(personImage)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            personImage.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            personImage.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor),
            personImage.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor),
            personImage.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    func configureCellUI(for person: Person) {
        personImage.image = person.profileImage
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
