//
//  CafeterialTableViewCell.swift
//  AppDev
//
//  Created by Esmaeil MIRZAEE on 2020-04-08.
//  Copyright © 2020 TheBeaver. All rights reserved.
//

import UIKit

class CafeterialTableViewCell: UITableViewCell {

    var nameLabel: UILabel!
    var ratingLabel: UILabel!
    var heartImageView: UIImageView!
    
    let padding: CGFloat = 8
    let labelHeight: CGFloat = 16
    let heartImageWidth: CGFloat = 20
    let heartImageHeight: CGFloat = 20
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont.systemFont(ofSize: 14, weight: .heavy)
        contentView.addSubview(nameLabel)
        
        ratingLabel = UILabel()
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.font = UIFont.systemFont(ofSize: 12, weight: .light)
        contentView.addSubview(ratingLabel)
        
        heartImageView = UIImageView(image: UIImage.init(systemName: "heart"))
        heartImageView.translatesAutoresizingMaskIntoConstraints = false
        heartImageView.contentMode = .scaleAspectFit
        heartImageView.isHidden = true
        contentView.addSubview(heartImageView)
        
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            nameLabel.heightAnchor.constraint(equalToConstant: labelHeight)
        ])
        
        NSLayoutConstraint.activate([
            ratingLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            ratingLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            ratingLabel.heightAnchor.constraint(equalTo: nameLabel.heightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            heartImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: padding * -1),
            heartImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            heartImageView.heightAnchor.constraint(equalToConstant: heartImageHeight),
            heartImageView.widthAnchor.constraint(equalToConstant: heartImageWidth)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(for cafeteria: Cafeteria) {
        nameLabel.text = cafeteria.name
        ratingLabel.text = "Rating: \(getStringFromRating(cafeteria.rating))"
    }
    
    func heartToggled(for isFavouratie: Bool) {
        heartImageView.isHidden = !isFavouratie
    }
    
    private func getStringFromRating(_ rating: CafeteriaRating) -> String {
        switch rating {
        case .bad:
            return "Bad"
        case .good:
            return "Good"
        case .great:
            return "Great"
        case .moderate:
            return "Moderate"
        case .not_tested_yet:
            return "Not tested yet"
        case .terrible:
            return "Terrible"
        }
        
    }
}
