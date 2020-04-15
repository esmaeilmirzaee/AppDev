//
//  MessageTableViewCell.swift
//  AppDev
//
//  Created by Esmaeil MIRZAEE on 2020-04-13.
//  Copyright © 2020 TheBeaver. All rights reserved.
//

import UIKit

enum BubbleType {
    case singleLine(width: CGFloat)
    case multiLine(height: CGFloat)
}

class MessageTableViewCell: UITableViewCell {
    var bubble: UIView!
    var messageLabel: UILabel!
    
    var message: Message!
    var type: BubbleType!
    
    let oneLineHeight: CGFloat = 50
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        backgroundColor = .white
        setupViews()
    }
    
    override func prepareForReuse() {
        bubble.snp.removeConstraints()
        messageLabel.snp.removeConstraints()
    }
    
    func configure(with message: Message, type: BubbleType) {
        self.message = message
        self.type = type
        messageLabel.text = message.body
        if message.sender == System.currentUser! {
            bubble.backgroundColor = .systemBlue
            bubble.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        } else {
            bubble.backgroundColor = .systemRed
            bubble.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        }
        
        setupConstraints()
    }
    
    func setupViews() {
        bubble = UIView()
        bubble.clipsToBounds = true
        bubble.layer.cornerRadius = Constants.bubbleCornerRadius
        contentView.addSubview(bubble)
        
        messageLabel = UILabel()
        messageLabel.textColor = .white
        messageLabel.numberOfLines = 0
        messageLabel.font = UIFont.systemFont(ofSize: UIFont.systemFontSize)
        contentView.addSubview(messageLabel)
    }
    
    func setupConstraints() {
        var heightInset: CGFloat = 0
        switch type! {
        case .singleLine(let width):
            bubble.snp.makeConstraints { (make) in
                make.width.equalTo(width + Constants.messagePadding * 2)
                make.height.equalTo(Constants.singleLineBubbleHeight)
                make.centerY.equalToSuperview()
                if message.sender == System.currentUser! {
                    make.right.equalToSuperview().inset(Constants.padding)
                } else {
                    make.left.equalToSuperview().offset(Constants.padding)
                }
            }
        case .multiLine(let height):
            bubble.snp.makeConstraints { make in
                make.width.equalTo(frame.width / 2 + Constants.messagePadding * 2)
                make.height.equalTo(height + Constants.messagePadding * 2)
                make.centerY.equalToSuperview()
                if message.sender == System.currentUser! {
                    make.right.equalToSuperview().inset(Constants.padding)
                } else {
                    make.left.equalToSuperview().offset(Constants.padding)
                }
            }
            heightInset = Constants.messagePadding
        }
        
        messageLabel.snp.makeConstraints { (make) in
            make.width.equalTo(bubble).inset(Constants.messagePadding)
            make.height.equalTo(bubble).inset(heightInset)
            make.center.equalTo(bubble)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
