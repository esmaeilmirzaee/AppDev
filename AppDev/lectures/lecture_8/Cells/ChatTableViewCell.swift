//
//  ChatTableViewCell.swift
//  AppDev
//
//  Created by Esmaeil MIRZAEE on 2020-04-13.
//  Copyright © 2020 TheBeaver. All rights reserved.
//

import UIKit

enum ChatState {
    case empty
    case regular(mostRecent: Message)
    case unread(mostRecent: Message)
}

class ChatTableViewCell: UITableViewCell {
    var profileDot: UIView!
    var nameLabel: UILabel!
    var mostRecentMessageLabel: UILabel!
    var newMessageDot: UIView!
    
    var chat: Chat!
    
    let profileDotLength: CGFloat = 40
    let newMessageDotLength: CGFloat = 15
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .white
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        profileDot = UIView()
        profileDot.backgroundColor = .systemBlue
        profileDot.clipsToBounds = true
        profileDot.layer.cornerRadius = profileDotLength / 2
        contentView.addSubview(profileDot)
        
        nameLabel = UILabel()
        nameLabel.textColor = .black
        contentView.addSubview(nameLabel)
        
        mostRecentMessageLabel = UILabel()
        mostRecentMessageLabel.textColor = .lightGray
        mostRecentMessageLabel.lineBreakMode = .byTruncatingTail
        contentView.addSubview(mostRecentMessageLabel)
        
        newMessageDot = UIView()
        newMessageDot.backgroundColor = .systemBlue
        newMessageDot.clipsToBounds = true
        newMessageDot.layer.cornerRadius = newMessageDotLength / 2
        contentView.addSubview(newMessageDot)
    }
    
    func setupConstraints() {
        profileDot.snp.makeConstraints { (make) in
            make.width.height.equalTo(profileDotLength)
            make.left.equalToSuperview().offset(Constants.padding)
            make.centerY.equalToSuperview()
        }
        
        newMessageDot.snp.makeConstraints { (make) in
            make.width.height.equalTo(newMessageDotLength)
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().inset(Constants.padding)
        }
        
        nameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(profileDot.snp.right).offset(Constants.padding)
            make.bottom.equalTo(snp.centerY)
            make.right.equalTo(newMessageDot.snp.left).inset(Constants.padding)
        }
    }
    
    func display(for state: ChatState) {
        switch state {
        case .empty:
            mostRecentMessageLabel.text = "Tap to chat"
            mostRecentMessageLabel.font = UIFont.systemFont(ofSize: UIFont.systemFontSize)
            nameLabel.font = UIFont.systemFont(ofSize: UIFont.systemFontSize)
            newMessageDot.isHidden = true
        case .regular(let mostRecentMessage):
            mostRecentMessageLabel.text = mostRecentMessage.body
            mostRecentMessageLabel.font = UIFont.systemFont(ofSize: UIFont.systemFontSize)
            nameLabel.font = UIFont.systemFont(ofSize: UIFont.systemFontSize)
            newMessageDot.isHidden = true
        case .unread(let mostRecentMessage):
            mostRecentMessageLabel.text = mostRecentMessage.body
            mostRecentMessageLabel.font = UIFont.boldSystemFont(ofSize: UIFont.systemFontSize)
            nameLabel.font = UIFont.boldSystemFont(ofSize: UIFont.systemFontSize)
            newMessageDot.isHidden = false
        }
    }
    
    func configure(with chat: Chat) {
        self.chat = chat
        nameLabel.text = chat.friend
        if let mostRecentMessage = chat.mostRecentMessage() {
            if !mostRecentMessage.hasRead && mostRecentMessage.recipient == System.currentUser! {
                display(for: .unread(mostRecent: mostRecentMessage))
            } else {
                display(for: .regular(mostRecent: mostRecentMessage))
            }
        } else {
            display(for: .empty)
        }
        
    }
}

