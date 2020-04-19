//
//  DetailViewController.swift
//  AppDev
//
//  Created by Esmaeil MIRZAEE on 2020-04-16.
//  Copyright © 2020 TheBeaver. All rights reserved.
//

import UIKit
import SnapKit

protocol SongDelegate {
    func changedSong(row: Int, song: Song)
}

class DetailViewController: UIViewController {
    
    var row: Int!
    var song: Song!
    var songDelegate: SongDelegate!
    
    var songLabel: UILabel!
    var artistLabel: UILabel!
    var albumLabel: UILabel!
    var songTextField: UITextField!
    var artistTextField: UITextField!
    var albumTextField: UITextField!
    var songImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = song.name
        view.backgroundColor = .white
        
        songLabel = UILabel()
        songLabel.textAlignment = .center
        songLabel.text = "Song:"
        songLabel.textColor = .black
        songLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        
        view.addSubview(songLabel)
        
        artistLabel = UILabel()
        artistLabel.textAlignment = .center
        artistLabel.text = "Artist:"
        artistLabel.textColor = .black
        artistLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        
        view.addSubview(artistLabel)
        
        albumLabel = UILabel()
        albumLabel.textAlignment = .center
        albumLabel.text = "Album:"
        albumLabel.textColor = .black
        albumLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        
        view.addSubview(albumLabel)
        
        songTextField = UITextField()
        songTextField.text = song.name
        songTextField.font = UIFont.systemFont(ofSize: 16)
        songTextField.layer.cornerRadius = 6
        songTextField.layer.borderWidth = 1
        
        
        view.addSubview(songTextField)
        
        artistTextField = UITextField()
        artistTextField.text = song.artist
        artistTextField.font = UIFont.systemFont(ofSize: 16)
        artistTextField.backgroundColor = .white
        artistTextField.layer.cornerRadius = 6
        artistTextField.layer.borderWidth = 1
        
        view.addSubview(artistTextField)
        
        albumTextField = UITextField()
        albumTextField.text = song.album
        albumTextField.backgroundColor = .white
        albumTextField.font = UIFont.systemFont(ofSize: 16)
        albumTextField.layer.cornerRadius = 6
        albumTextField.layer.borderWidth = 1
        
        view.addSubview(albumTextField)
        
        songImageView = UIImageView()
        songImageView.contentMode = .scaleAspectFill
//        songImageView.image = UIImage(imageLiteralResourceName: song.imageName)
        if let image = song.image {
            songImageView.image = image
        }
        
        view.addSubview(songImageView)
        
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        songLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).offset(18)
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(18)
            make.width.equalTo(60)
            make.height.equalTo(20)
        }
        
        artistLabel.snp.makeConstraints { (make) in
            make.left.equalTo(songLabel.snp.left)
            make.top.equalTo(songLabel.snp.bottom).offset(24)
            make.width.equalTo(songLabel.snp.width)
            make.height.equalTo(songLabel.snp.height)
        }
        
        albumLabel.snp.makeConstraints { (make) in
            make.left.equalTo(songLabel.snp.left)
            make.top.equalTo(artistLabel.snp.bottom).offset(24)
            make.width.equalTo(songLabel.snp.width)
            make.height.equalTo(songLabel.snp.height)
        }
        
        songTextField.snp.makeConstraints { (make) in
            make.left.equalTo(songLabel.snp.right).offset(10)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).inset(8)
            make.height.equalTo(30)
            make.centerY.equalTo(songLabel.snp.centerY)
        }
        
        artistTextField.snp.makeConstraints { (make) in
            make.left.equalTo(songTextField.snp.left)
            make.centerY.equalTo(artistLabel.snp.centerY)
            make.right.equalTo(songTextField.snp.right)
            make.height.equalTo(songTextField.snp.height)
        }
        
        albumTextField.snp.makeConstraints { (make) in
            make.left.equalTo(songTextField.snp.left)
            make.centerY.equalTo(albumLabel.snp.centerY)
            make.right.equalTo(songTextField.snp.right)
            make.height.equalTo(songTextField.snp.height)
        }
        
        songImageView.snp.makeConstraints { (make) in
            make.centerX.equalTo(view.snp.centerX)
            make.width.equalTo(300)
            make.height.equalTo(300)
            make.top.equalTo(albumTextField.snp.bottom).offset(100)
        }
    }
}
