//
//  ChatViewController.swift
//  AppDev
//
//  Created by Esmaeil MIRZAEE on 2020-04-13.
//  Copyright © 2020 TheBeaver. All rights reserved.
//

import UIKit
import Firebase
import SnapKit

class ChatViewController: UIViewController {
    var messagesTableView: UITableView!
    var border: UIView!
    var messageTextField: UITextField!
    var sendButton: UIButton!
    
    var chat: Chat!
    var newMessage = ""
    
    let messagesReuseIdentifier = "message"
    let sendButtonTitle = "Send"
    let messagePlaceholder = "Type a message"
    let oneLineHeight: CGFloat = 50
    let sendButtonHeight: CGFloat = 50
    let borderHeight: CGFloat = 0.5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        title = chat.friend
        view.backgroundColor = .white
        setupViews()
        setupConstraints(keyboardHeight: 0)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            setupConstraints(keyboardHeight: keyboardSize.height)
        }
    }
    
    @objc func keyboardWillHide() {
        setupConstraints(keyboardHeight: 0)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        listenForNewMessages()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        stopListening()
    }
    
    func listenForNewMessages() {
        
    }
    
    func scrollToBottom(animated: Bool) {
        messagesTableView.scrollToRow(at: IndexPath(row: chat.messages.count - 1, section: 0), at: .bottom, animated: animated)
    }
    
    func updateRead(message: Message) {
        DatabaseManager.updateRead(chatId: chat.id, message: message)
    }
    
    func stopListening() {
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    func setupViews() {
        messagesTableView = UITableView()
        messagesTableView.delegate = self
        messagesTableView.dataSource = self
        messagesTableView.register(MessageTableViewCell.self, forCellReuseIdentifier: messagesReuseIdentifier)
        messagesTableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: Constants.padding))
        messagesTableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: Constants.padding))
        messagesTableView.separatorStyle = .none
        view.addSubview(messagesTableView)
        
        sendButton = UIButton()
        sendButton.addTarget(self, action: #selector(sendButtonSelector), for: .touchUpInside)
        sendButton.setTitle(sendButtonTitle, for: .normal)
        sendButton.setTitleColor(.systemBlue, for: .normal)
        sendButton.titleLabel?.textAlignment = .center
        sendButton.titleLabel?.font = UIFont.systemFont(ofSize: UIFont.systemFontSize)
        view.addSubview(sendButton)
        
        messageTextField = UITextField()
        messageTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        messageTextField.placeholder = messagePlaceholder
        messageTextField.font = UIFont.systemFont(ofSize: UIFont.systemFontSize)
        view.addSubview(messageTextField)
        
        border = UIView()
        border.backgroundColor = .systemGray
        view.addSubview(border)
        
        scrollToBottom(animated: true)
    }
    
    @objc func textDidChange() {
        guard let text = messageTextField.text else { return }
        newMessage = text
    }
    
    @objc func sendButtonSelector() {
        if newMessage.isEmpty {
            let alertController = UIAlertController(title: "Hold on!", message: "Your message cannot be empty.", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Okay", style: .default, handler: { (_) in
                alertController.dismiss(animated: true, completion: nil)
            }))
            present(alertController, animated: true, completion: nil)
            return
        }
        let message = Message(sender: System.currentUser!, recipient: chat.friend, body: newMessage, hasRead: false, timestamp: Date().timeIntervalSince1970)
        DatabaseManager.sendMessage(chatId: chat.id, message: message)
        messageTextField.text = ""
    }
    
    func setupConstraints(keyboardHeight: CGFloat) {
//        let sendButtonWidth = sendButtonTitle.wid
//            sendButtonTitle.width(withConstrainedHeight: sendButtonHeight, font: sendButton.titleLabel!.font)
//        sendButtonWidth.snp.remakeConstraints { make in
//            make.width.equalTo(sendButtonWidth)
//            make.height.equalTo(sendButtonHeight)
//            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(keyboardHeight)
//            make.right.equalToSuperView().inset(Constants.padding)
//        }
//        
//        messageTextField.snp.remakeConstraints { make in
//            make.width.equalTo(view.frame.width - Constants.padding * 3 - sendButtonWidth)
//            make.left.equalToSuperview().offset(Constants.padding)
//            make.height.equalTo(sendButton)
//            make.bottom.equalTo(sendButton)
//        }
        
        border.snp.remakeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalTo(borderHeight)
            make.bottom.equalTo(sendButton.snp.top)
        }
        
        messagesTableView.snp.remakeConstraints { (make) in
            make.width.equalToSuperview()
            make.bottom.equalTo(border.snp.top)
            make.top.equalToSuperview()
        }
    }
    
    func bubbleType(message: Message) -> BubbleType {
        let oneLineWidth: CGFloat = 100
        if oneLineWidth <= view.frame.width / 2 {
            return .singleLine(width: oneLineWidth)
        }
        let height: CGFloat = 100
        return .multiLine(height: height)
    }
}

extension ChatViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let message = chat.messages[indexPath.row]
        switch bubbleType(message: message) {
        case .singleLine(_):
            return Constants.singleLineBubbleHeight + Constants.interMessageSpacing
        case .multiLine(let height):
            return height + Constants.interMessageSpacing + Constants.messagePadding * 2
        }
    }
}

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chat.messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = messagesTableView.dequeueReusableCell(withIdentifier: messagesReuseIdentifier, for: indexPath) as! MessageTableViewCell
        let message = chat.messages[indexPath.row]
        cell.configure(with: message, type: bubbleType(message: message))
        cell.selectionStyle = .none
        return cell
    }
}
