//
//  LectureSixCellTableViewCell.swift
//  AppDev
//
//  Created by Esmaeil MIRZAEE on 2020-04-12.
//  Copyright © 2020 TheBeaver. All rights reserved.
//

import UIKit
import SnapKit

class LectureSixCellTableViewCell: UITableViewCell {

    var courseNameLabel: UILabel!
    var courseCodeLabel: UILabel!
    var instructorLabel: UILabel!
    var enrolled: UIImageView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        courseCodeLabel = UILabel()
        courseCodeLabel.textAlignment = .center
        courseCodeLabel.textColor = .systemRed
        courseCodeLabel.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        
        contentView.addSubview(courseCodeLabel)
        
        courseNameLabel = UILabel()
        courseNameLabel.textAlignment = .left
        courseNameLabel.textColor = .black
        courseNameLabel.font = UIFont.systemFont(ofSize: 10, weight: .bold)
        
        contentView.addSubview(courseNameLabel)
        
        instructorLabel = UILabel()
        instructorLabel.textAlignment = .left
        instructorLabel.textColor = .systemGray3
        instructorLabel.font = UIFont.systemFont(ofSize: 10, weight: .light)
        
        contentView.addSubview(instructorLabel)
        
        enrolled = UIImageView()
        enrolled.image = UIImage(systemName: "checkmark")
        enrolled.isHidden = true
        
        contentView.addSubview(enrolled)
        
        
        setupConstraints()
    }
    
    func setupConstraints() {
        
        courseCodeLabel.snp.makeConstraints { (make) in
            make.top.leading.equalTo(contentView).offset(10)
            make.centerY.equalTo(contentView)
        }
        
        courseNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(contentView).offset(10)
            make.leading.equalTo(courseCodeLabel.snp.trailing).offset(20)
        }
        
        instructorLabel.snp.makeConstraints { (make) in
            make.top.equalTo(courseNameLabel.snp.bottom).offset(2)
            make.leading.equalTo(courseNameLabel.snp.leading)
        }
        
        enrolled.snp.makeConstraints { (make) in
            make.trailing.equalTo(contentView.snp.trailing).inset(6)
            make.top.equalTo(contentView.snp.top).offset(10)
        }
    }
    
    func configureCell(for course: Course) {
        courseCodeLabel.text = "\(course.code)"
        courseNameLabel.text = course.name
        instructorLabel.text = course.instructor
        enrolled.isHidden = course.enrolled
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
