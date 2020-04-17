//
//  LectureNineMainViewController.swift
//  AppDev
//
//  Created by Esmaeil MIRZAEE on 2020-04-15.
//  Copyright © 2020 TheBeaver. All rights reserved.
//

import UIKit

class LectureNineMainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Lecture NINE"
        
        view.backgroundColor = .white
        let lecturesMainViewController = LecturesMainViewController()
        navigationController?.pushViewController(lecturesMainViewController, animated: false)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let albumViewController = AlbumViewController()
        navigationController?.pushViewController(albumViewController, animated: false)
    }
}
