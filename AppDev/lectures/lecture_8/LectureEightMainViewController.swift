//
//  LectureEightMainViewController.swift
//  AppDev
//
//  Created by Esmaeil MIRZAEE on 2020-04-12.
//  Copyright © 2020 TheBeaver. All rights reserved.
//

import UIKit
import GoogleSignIn
import Firebase
import SnapKit

class LectureEightMainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Lecture 8"
        view.backgroundColor = .white
        
        GIDSignIn.sharedInstance()?.presentingViewController = self
        let chatsViewController = ChatsViewController()
        navigationController?.pushViewController(chatsViewController, animated: true)
    }
}
