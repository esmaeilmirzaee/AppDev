//
//  ChatsViewController.swift
//  AppDev
//
//  Created by Esmaeil MIRZAEE on 2020-04-13.
//  Copyright © 2020 TheBeaver. All rights reserved.
//

import UIKit
import GoogleSignIn
import Firebase
import FirebaseDatabase

class ChatsViewController: UIViewController {
    var chatsTableView: UITableView!
    
    let chatsReuseIdentifier = "chats"
    let cellHeight: CGFloat = 65
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance()?.presentingViewController = self
        title = "Chats"
        view.backgroundColor = .white
//        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonPressed))
        
        setupViews()
        setupConstraints()
        getChats()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = false
        
        if let chatsTableView = chatsTableView {
            chatsTableView.reloadData()
            listenForNewMessages()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        stopListening()
    }
    
    func alertError() {
        
    }
    
    func stopListening() {
        
    }
    
    func listenForNewMessages() {
        
    }
    
    func getChats() {
        DatabaseManager.getChatInfo { info in
            
            if let info = info {
                DatabaseManager.getChats(info: info, completion: { (gotChats) in
                    if gotChats {
                    self.listenForNewMessages()
                    DispatchQueue.main.async {
                        self.chatsTableView.reloadData()
                    }
                } else {
                    self.alertError()
                }
            })
            } else {
                print("Not able to retrieve chats")
                self.alertError()
            }
        }
    }
    
    @objc func addButtonPressed() {
        let addFriendViewController = AddFriendViewController()
        present(UINavigationController(rootViewController: addFriendViewController), animated: true, completion: nil)
    }
    
    func setupViews() {
        chatsTableView = UITableView()
        chatsTableView.delegate = self
        chatsTableView.dataSource = self
        chatsTableView.separatorStyle = .none
        chatsTableView.register(ChatTableViewCell.self, forCellReuseIdentifier: chatsReuseIdentifier)
        chatsTableView.rowHeight = cellHeight
        view.addSubview(chatsTableView)
    }
    
    func setupConstraints() {
        chatsTableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}

extension ChatsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let chat = System.chats[indexPath.row]
        let chatViewController = ChatViewController()
        chatViewController.chat = chat
        navigationController?.pushViewController(chatViewController, animated: true)
    }
}

extension ChatsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return System.chats.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = chatsTableView.dequeueReusableCell(withIdentifier: chatsReuseIdentifier, for: indexPath) as! ChatTableViewCell
        let chat = System.chats[indexPath.row]
        cell.configure(with: chat)
        cell.selectionStyle = .none
        return cell
    }
}
