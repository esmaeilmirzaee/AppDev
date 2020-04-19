//
//  ProjectThreeMainViewController.swift
//  AppDev
//
//  Created by Esmaeil MIRZAEE on 2020-04-18.
//  Copyright © 2020 TheBeaver. All rights reserved.
//

import UIKit

class ProjectThreeMainViewController: UIViewController {

    var greenView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Project Three"
        view.backgroundColor = .white
        
        greenView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 100))
        greenView.backgroundColor = .gray
        view.addSubview(greenView)
        
        setupConstraints()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first?.location(in: view) {
            greenView.center = touch
        }
    }
    
    private func setupConstraints() {
        greenView.snp.makeConstraints { (make) in
//            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
//            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left)
//            make.center.equalTo(self.view.safeAreaLayoutGuide.snp.center)
        }
    }
}
