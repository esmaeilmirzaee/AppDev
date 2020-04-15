//
//  PracticeCafeteriaTableViewCell.swift
//  AppDev
//
//  Created by Esmaeil MIRZAEE on 2020-04-10.
//  Copyright © 2020 TheBeaver. All rights reserved.
//

import UIKit

class PracticeCafeteriaTableViewCell: UITableViewCell {

    var nameLabel: UILabel!
    var ratingLabel: UILabel!
    var heartImageView: UIImageView!
    var answerAButton: UIButton!
    var answerBButton: UIButton!
    var answerCButton: UIButton!
    var answerDButton: UIButton!
    
    let padding: CGFloat = 8.0
    let labelHeight: CGFloat = 32.0
    let heartImageHeight: CGFloat = 40.0
    let heartImageWidth: CGFloat = 40.0
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont.systemFont(ofSize: 16, weight: .black)
        
        contentView.addSubview(nameLabel)
        
        ratingLabel = UILabel()
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.font = UIFont.systemFont(ofSize: 12, weight: .light)
        ratingLabel.textColor = .systemGray
        
        contentView.addSubview(ratingLabel)
        
        heartImageView = UIImageView()
        heartImageView.translatesAutoresizingMaskIntoConstraints = false
        heartImageView.contentMode = .scaleAspectFit
        heartImageView.isHidden = true
        
        contentView.addSubview(heartImageView)
        
        setupConstraint()
    }
    
    func setupConstraint() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            nameLabel.heightAnchor.constraint(equalToConstant: labelHeight)
        ])
        
        NSLayoutConstraint.activate([
            ratingLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            ratingLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            ratingLabel.heightAnchor.constraint(equalTo: nameLabel.heightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            heartImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: padding * -1),
            heartImageView.widthAnchor.constraint(equalToConstant: heartImageWidth),
            heartImageView.heightAnchor.constraint(equalToConstant: heartImageHeight),
            heartImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    func configureUICell(for cafeteria: PracticeCafeteria) {
        nameLabel.text = cafeteria.name
        ratingLabel.text = ratingToString(cafeteria.rating)
        
    }
    
    private func ratingToString(_ rating: PracticeCafeteriaRating) -> String {
        switch rating {
        case .bad: return "Bad"
        case .best: return "Best"
        case .good: return "Good"
        case .moderate: return "Moderate"
        case .terrible: return "Terrible"
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
