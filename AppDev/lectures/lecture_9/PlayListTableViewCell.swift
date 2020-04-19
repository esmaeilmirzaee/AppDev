//
//  PlayListTableViewCell.swift
//  AppDev
//
//  Created by Esmaeil MIRZAEE on 2020-04-16.
//  Copyright © 2020 TheBeaver. All rights reserved.
//

import UIKit

protocol PlaylistCellDelegate: class {
    func favouriteButtonTapped(row: Int)
}

class PlayListTableViewCell: UITableViewCell {
    
    var songImageView: UIImageView!
    var songNameLabel: UILabel!
    var infoLabel: UILabel!
    var favourite: UIButton!
    var isFavourite: Bool!
    
    var playlistCellDelegate: PlaylistCellDelegate!
    var row: Int!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .white
        
        songImageView = UIImageView()
        songImageView.contentMode = .scaleAspectFill
        songImageView.layer.cornerRadius = 6
        contentView.addSubview(songImageView)
        
        songNameLabel = UILabel()
        songNameLabel.font = UIFont.systemFont(ofSize: 14)
        songNameLabel.textColor = .black
        contentView.addSubview(songNameLabel)
        
        infoLabel = UILabel()
        infoLabel.font = UIFont.systemFont(ofSize: 12)
        infoLabel.textColor = .black
        contentView.addSubview(infoLabel)
        
        favourite = UIButton()
        favourite.imageView?.contentMode = .scaleAspectFill
        favourite.addTarget(self, action: #selector(toggleFavourite), for: .touchUpInside)
        contentView.addSubview(favourite)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Init (coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        songImageView.snp.makeConstraints { (make) in
            make.width.equalTo(45)
            make.height.equalTo(songImageView.snp.width)
            make.centerY.equalTo(contentView.snp.centerY)
            make.left.equalTo(contentView.snp.left).offset(10)
        }
        
        songNameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(songImageView.snp.right).offset(7.5)
            make.top.equalTo(contentView.snp.top).offset(10)
            make.width.equalTo(frame.width * 0.75)
            make.height.equalTo(15)
        }
        
        infoLabel.snp.makeConstraints { (make) in
            make.left.equalTo(songNameLabel.snp.left)
            make.top.equalTo(songNameLabel.snp.bottom)
            make.width.equalTo(songNameLabel.snp.width)
            make.height.equalTo(songNameLabel.snp.height)
        }
        
        favourite.snp.makeConstraints { (make) in
            make.width.equalTo(30)
            make.height.equalTo(favourite.snp.width)
            make.centerY.equalTo(contentView.snp.centerY)
            make.right.equalTo(contentView.snp.right).inset(10)
        }
    }
    
    func configure(for song: Song) {
        songNameLabel.text = song.name
        infoLabel.text = "\(song.artist) · \(song.album)"
        isFavourite = song.isFavourite
        if (song.isFavourite) {
            favourite.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        } else {
            favourite.setImage(UIImage(systemName: "heart"), for: .normal)
        }
        
//        songImageView.image = UIImage(imageLiteralResourceName: song.imageName)
        if let image = song.image {
            songImageView.image = image
        }
    }
    
    @objc func toggleFavourite() {
        if (!isFavourite) {
            favourite.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            isFavourite = true
        } else {
            favourite.setImage(UIImage(systemName: "heart"), for: .normal)
            isFavourite = false
        }
        playlistCellDelegate.favouriteButtonTapped(row: row)
    }
    
}
