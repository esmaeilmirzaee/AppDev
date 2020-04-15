//
//  SignInViewController.swift
//  AppDev
//
//  Created by Esmaeil MIRZAEE on 2020-04-13.
//  Copyright © 2020 TheBeaver. All rights reserved.
//

import UIKit
import GoogleSignIn

class SignInViewController: UIViewController {
    var appNameLabel: UILabel!
    var signInButton: GIDSignInButton!
    
    let verticalSpace: CGFloat = 125
    let appName = "Firebase Chat"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        GIDSignIn.sharedInstance()?.presentingViewController = self
        
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        appNameLabel = UILabel()
        appNameLabel.font = UIFont.boldSystemFont(ofSize: 40)
        appNameLabel.textAlignment = .center
        appNameLabel.text = appName
        view.addSubview(appNameLabel)
        
        signInButton = GIDSignInButton()
        signInButton.style = .wide
        signInButton.colorScheme = .light
        view.addSubview(signInButton)
    }
    
    func setupConstraints() {
        appNameLabel.snp.makeConstraints { (make) in
            make.width.equalToSuperview().inset(Constants.padding)
            make.bottom.equalTo(view.snp.centerY).offset(-verticalSpace / 2)
            make.centerX.equalToSuperview()
        }
        
        signInButton.snp.makeConstraints { (make) in
            make.top.equalTo(view.snp.centerY).offset(verticalSpace / 2)
            make.centerX.equalToSuperview()
        }
    }
    
}
