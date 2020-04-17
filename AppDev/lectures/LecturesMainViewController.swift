//
//  LecturesMainViewController.swift
//  AppDev
//
//  Created by Esmaeil MIRZAEE on 2020-04-08.
//  Copyright © 2020 TheBeaver. All rights reserved.
//

import UIKit
import SnapKit

class LecturesMainViewController: UIViewController {

    var lectureOneButton: UIButton!
    var lectureTwoButton: UIButton!
    var lectureThreeButton: UIButton!
    var lectureFourButton: UIButton!
    var lectureFiveButton: UIButton!
    var lectureSixButton: UIButton!
    var lectureEightButton: UIButton!
    var lectureNineButton: UIButton!
    
    let primaryColour: CGColor = .init(srgbRed: 0.05, green: 0.63, blue: 0.94, alpha: 1.000)
    let secondaryColour: UIColor = UIColor(red: 0.05, green: 0.673, blue: 0.863, alpha: 1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Lectures"
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = false
        
        lectureTwoButton = UIButton()
        lectureTwoButton.setTitle("Lecture 2", for: .normal)
        lectureTwoButton.setTitleColor(secondaryColour, for: .normal)
        lectureTwoButton.backgroundColor = .clear
        lectureTwoButton.layer.masksToBounds = true
        lectureTwoButton.layer.borderWidth = 1
        lectureTwoButton.layer.borderColor = primaryColour
        lectureTwoButton.setTitleShadowColor(.darkGray, for: .normal)
        lectureTwoButton.addTarget(self, action: #selector(lectureTwoSelector), for: .touchUpInside)
        
        view.addSubview(lectureTwoButton)
        
        lectureThreeButton = UIButton()
        lectureThreeButton.translatesAutoresizingMaskIntoConstraints = false
        lectureThreeButton.setTitle("Lecture 3", for: .normal)
        lectureThreeButton.setTitleColor(secondaryColour, for: .normal)
        lectureThreeButton.backgroundColor = .clear
        lectureThreeButton.layer.masksToBounds = true
        lectureThreeButton.layer.borderWidth = 1
        lectureThreeButton.layer.borderColor = primaryColour
        lectureThreeButton.setTitleShadowColor(.darkGray, for: .normal)
        lectureThreeButton.addTarget(self, action: #selector(lectureThreeSelector), for: .touchUpInside)
        
        view.addSubview(lectureThreeButton)
        
        lectureFourButton = UIButton()
        lectureFourButton.translatesAutoresizingMaskIntoConstraints = false
        lectureFourButton.setTitle("Lecture 4", for: .normal)
        lectureFourButton.setTitleColor(secondaryColour, for: .normal)
        lectureFourButton.layer.masksToBounds = true
        lectureFourButton.layer.borderWidth = 1
        lectureFourButton.layer.borderColor = primaryColour
        lectureFourButton.setTitleShadowColor(.darkGray, for: .normal)
        lectureFourButton.addTarget(self, action: #selector(lectureFourSelector), for: .touchUpInside)
        
        view.addSubview(lectureFourButton)
        
        lectureFiveButton = UIButton()
        lectureFiveButton.translatesAutoresizingMaskIntoConstraints = false
        lectureFiveButton.setTitle("Lecture 5", for: .normal)
        lectureFiveButton.setTitleColor(secondaryColour, for: .normal)
        lectureFiveButton.layer.masksToBounds = true
        lectureFiveButton.layer.borderWidth = 1
        lectureFiveButton.layer.borderColor = primaryColour
        lectureFiveButton.setTitleShadowColor(.darkGray, for: .normal)
        lectureFiveButton.addTarget(self, action: #selector(lectureFiveSelector), for: .touchUpInside)
        
        view.addSubview(lectureFiveButton)
        
        
        lectureSixButton = UIButton()
        lectureSixButton.translatesAutoresizingMaskIntoConstraints = false
        lectureSixButton.setTitle("Lecture 6", for: .normal)
        lectureSixButton.setTitleColor(secondaryColour, for: .normal)
        lectureSixButton.layer.masksToBounds = true
        lectureSixButton.layer.borderWidth = 1
        lectureSixButton.layer.borderColor = primaryColour
        lectureSixButton.setTitleShadowColor(.darkGray, for: .normal)
        lectureSixButton.addTarget(self, action: #selector(lectureSixSelector), for: .touchUpInside)
        
        view.addSubview(lectureSixButton)
        
        lectureEightButton = UIButton()
        lectureEightButton.setTitle("Lecture 8", for: .normal)
        lectureEightButton.setTitleColor(secondaryColour, for: .normal)
        lectureEightButton.layer.masksToBounds = true
        lectureEightButton.layer.borderWidth = 1
        lectureEightButton.layer.borderColor = primaryColour
        lectureEightButton.setTitleShadowColor(.darkGray, for: .normal)
        lectureEightButton.addTarget(self, action: #selector(lectureEightSelector), for: .touchUpInside)
        
        view.addSubview(lectureEightButton)
        
        lectureNineButton = UIButton()
        lectureNineButton.setTitle("Lecture 9", for: .normal)
        lectureNineButton.setTitleColor(secondaryColour, for: .normal)
        lectureNineButton.layer.masksToBounds = true
        lectureNineButton.layer.borderWidth = 1
        lectureNineButton.layer.borderColor = primaryColour
        lectureNineButton.setTitleShadowColor(.darkGray, for: .normal)
        lectureNineButton.addTarget(self, action: #selector(lectureNineSelector), for: .touchUpInside)
        
        view.addSubview(lectureNineButton)
        
        setupConstraint()
    }
    
    func setupConstraint() {
        
        lectureTwoButton.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
            make.centerX.equalTo(view.safeAreaLayoutGuide.snp.centerX)
            make.width.equalTo(180)
        }
        
        NSLayoutConstraint.activate([
            lectureThreeButton.topAnchor.constraint(equalTo: lectureTwoButton.bottomAnchor, constant: 16),
            lectureThreeButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            lectureThreeButton.widthAnchor.constraint(equalToConstant: 180)
        ])
        
        NSLayoutConstraint.activate([
            lectureFourButton.topAnchor.constraint(equalTo: lectureThreeButton.bottomAnchor, constant: 16),
            lectureFourButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            lectureFourButton.widthAnchor.constraint(equalToConstant: 180)
        ])
        
        NSLayoutConstraint.activate([
            lectureFiveButton.topAnchor.constraint(equalTo: lectureFourButton.bottomAnchor, constant: 16),
            lectureFiveButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            lectureFiveButton.leadingAnchor.constraint(equalTo: lectureFourButton.leadingAnchor),
            lectureFiveButton.trailingAnchor.constraint(equalTo: lectureFourButton.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            lectureSixButton.topAnchor.constraint(equalTo: lectureFiveButton.bottomAnchor, constant: 16),
            lectureSixButton.leadingAnchor.constraint(equalTo: lectureFiveButton.leadingAnchor),
            lectureSixButton.trailingAnchor.constraint(equalTo: lectureFiveButton.trailingAnchor)
        ])
        
        lectureEightButton.snp.makeConstraints { (make) in
            make.top.equalTo(lectureSixButton.snp.bottom).offset(16)
            make.leading.equalTo(lectureSixButton.snp.leading)
            make.trailing.equalTo(lectureSixButton.snp.trailing)
        }
        
        lectureNineButton.snp.makeConstraints { (make) in
            make.top.equalTo(lectureEightButton.snp.bottom).offset(16)
            make.leading.equalTo(lectureEightButton.snp.leading)
            make.trailing.equalTo(lectureEightButton.snp.trailing)
        }
        
    }
    
    @objc func lectureTwoSelector() {
        let lectureTwoViewController = LectureTwoMainViewController()
        present(lectureTwoViewController, animated: true, completion: nil)
    }

    @objc func lectureThreeSelector() {
        let lectureThreeViewController = LectureThreeViewController()
        navigationController?.pushViewController(lectureThreeViewController, animated: true)
    }
    
    @objc func lectureFourSelector() {
        let lectureFourViewController = LectureFourViewController()
        navigationController?.pushViewController(lectureFourViewController, animated: true)
    }
    
    @objc func lectureFiveSelector() {
        let lectureFiveMainViewController = LectureFiveMainViewController()
        navigationController?.pushViewController(lectureFiveMainViewController, animated: true)
    }
    
    @objc func lectureSixSelector() {
        let lectureSixMainViewController = LectureSixMainViewController()
        navigationController?.pushViewController(lectureSixMainViewController, animated: true)
    }
    
    @objc func lectureEightSelector() {
        let lectureEightMainViewController = LectureEightMainViewController()
        navigationController?.pushViewController(lectureEightMainViewController, animated: true)
    }
    
    @objc func lectureNineSelector() {
        let lectureNineMainViewController = LectureNineMainViewController()
        navigationController?.pushViewController(lectureNineMainViewController, animated: true)
    }
    
}
