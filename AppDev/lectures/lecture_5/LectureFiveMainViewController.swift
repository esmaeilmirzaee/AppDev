//
//  LectureFiveMainViewController.swift
//  AppDev
//
//  Created by Esmaeil MIRZAEE on 2020-04-11.
//  Copyright © 2020 TheBeaver. All rights reserved.
//

import UIKit

class LectureFiveMainViewController: UIViewController {

    var header: UILabel!
    var collectionView: UICollectionView!
    var refreshControl: UIRefreshControl!
    var people: [Person]!
    
    let photoCellReuseIdentifier = "photoCellReuseIdentifier"
    let headerReuseIdentifier = "headerReuseIdentifier"
    let padding: CGFloat = 8
    let headerHeight: CGFloat = 30
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Lecture 5"
        view.backgroundColor = .white
        
        let one = Person(imageName: "LaunchScreenLogo")
        let two = Person(imageName: "thebeaver")
        people = [one, two, two, two, one, one, two, one, two, one, one]
        
        header = UILabel()
        header.translatesAutoresizingMaskIntoConstraints = false
        header.text = "\(people.count)"
        header.textAlignment = .center
        header.textColor = .systemRed
        header.backgroundColor = .systemGray6
        header.font = UIFont.systemFont(ofSize: 18, weight: .black)
        
        view.addSubview(header)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = padding
        layout.minimumInteritemSpacing = padding
        
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(pullToRefreshSelector), for: .valueChanged)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.register(PersonCollectionViewCell.self, forCellWithReuseIdentifier: photoCellReuseIdentifier)
        collectionView.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerReuseIdentifier)
        collectionView.refreshControl = refreshControl
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
        
        setupConstraint()
    }
    
    func setupConstraint() {
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            header.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            header.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            header.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: header.bottomAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    @objc func pullToRefreshSelector() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.refreshControl.endRefreshing()
        }
    }
}


extension LectureFiveMainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let peopleCount = people?.count {
            return peopleCount
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: photoCellReuseIdentifier, for: indexPath) as! PersonCollectionViewCell
        cell.configureCellUI(for: people[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerReuseIdentifier, for: indexPath) as! HeaderCollectionReusableView
        return headerView
    }
    
}

extension LectureFiveMainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        people.remove(at: indexPath.item)
//        collectionView.reloadData()
//        header.text = "\(people.count)"
        let aTestViewController = ATestViewController()
        navigationController?.pushViewController(aTestViewController, animated: true)
    }
}

extension LectureFiveMainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let length = (collectionView.frame.width - 4 * padding) / 2
        return CGSize(width: length, height: length)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: headerHeight)
    }
    
}
