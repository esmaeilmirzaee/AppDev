//
//  ResultTableTableViewCell.swift
//  AppDev
//
//  Created by Esmaeil MIRZAEE on 2020-04-13.
//  Copyright © 2020 TheBeaver. All rights reserved.
//

import UIKit
import SnapKit

protocol ResultTableViewCellDelegate: class {
    func resultTableViewCellDidTapAddButton(result: String)
}

class ResultTableViewCell: UITableViewCell {
    var nameLabel: UILabel!
    var addButton: UIButton!
    
    var result: String!
    weak var delegate: ResultTableViewCellDelegate?
    
    let addButtonHeight: CGFloat = 25
    let addButtonTitle = "Add"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .white
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func addButtonPressed() {
        delegate?.resultTableViewCellDidTapAddButton(result: result)
    }
    
    func setupViews() {
        nameLabel = UILabel()
        nameLabel.textColor = .black
        nameLabel.font = UIFont.systemFont(ofSize: UIFont.systemFontSize)
        contentView.addSubview(nameLabel)
        
        addButton = UIButton()
        addButton.addTarget(self, action: #selector(addButtonPressed), for: .touchUpInside)
        addButton.layer.cornerRadius = addButtonHeight / 2
        addButton.backgroundColor = .systemBlue
        addButton.setTitle(addButtonTitle, for: .normal)
        addButton.setTitleColor(.white, for: .normal)
        addButton.titleLabel?.textAlignment = .center
        addButton.titleLabel?.font = UIFont.systemFont(ofSize: UIFont.systemFontSize)
        contentView.addSubview(addButton)
    }
    
    func setupConstraints() {
        let addButtonWidth = ((addButton.titleLabel?.intrinsicContentSize)!).width
        print(addButtonWidth)
        addButton.snp.makeConstraints { (make) in
            make.width.equalTo(addButtonWidth + Constants.padding * 2 )
            make.height.equalTo(addButtonHeight)
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().inset(Constants.padding)
        }
        
        nameLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(Constants.padding)
            make.right.equalTo(addButton.snp.left).inset(Constants.padding)
            make.centerY.equalToSuperview()
        }
    }
    
    func configure(with result: String, delegate: ResultTableViewCellDelegate) {
        self.result = result
        self.delegate = delegate
        nameLabel.text = result
    }
}
