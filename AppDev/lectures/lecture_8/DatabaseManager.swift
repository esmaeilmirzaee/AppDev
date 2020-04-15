//
//  DatabaseManager.swift
//  AppDev
//
//  Created by Esmaeil MIRZAEE on 2020-04-13.
//  Copyright © 2020 TheBeaver. All rights reserved.
// https://turbobit.net/download/free/a0r2ie05o1hn?asgtbndr=1

import UIKit
import Foundation
import Firebase
import FirebaseDatabase

class DatabaseManager {
    static var url: String {
        guard let path = Bundle.main.path(forResource: "GoogleService-Info", ofType: "plist"), let dict = NSDictionary(contentsOfFile: path) else { return "" }
        return dict.value(forKey: "DATABASE_URL") as! String
    }
    
    static var ref: DatabaseReference {
        return Database.database().reference(fromURL: url)
    }
    
    static func getChatInfo(completion: @escaping ([(String, String)]?) -> Void) {
//        print("SOMETHINGSOMETHINGSOMETHINGSOMETHING---\(System.currentUser!)")
        let user = System.currentUser!.replacingOccurrences(of: ".", with: "")
        ref.child("users/\(user)/chats").observeSingleEvent(of: .value, with: { snapshot in
            if let infoDict = snapshot.value as? [String: Any] {
                let info = infoDict.map { (chatId, friend) in (chatId, friend as! String) }
                completion(info)
            } else {
                completion(nil)
            }
        }) { error in
            print(error.localizedDescription)
            completion(nil)
        }
    }
    
    static func getChats(info: [(String, String)], completion: @escaping (Bool) -> Void) {
        var success = true
        let dispatchGroup = DispatchGroup()
        var chats = [Chat]()
        info.forEach { (chatId, friend) in
            dispatchGroup.enter()
            ref.child("chats/\(chatId)/messages").observeSingleEvent(of: .value, with: { snapshot in
                print(snapshot)
                if let messagesDict = snapshot.value as? [String: Any] {
                    var messages = [Message]()
                    messagesDict.forEach { (messageId, messageObject) in
                        let message = Message.fromDatabase(object: messageObject as! [String: Any])
                        message.id = messageId
                        messages.append(message)
                    }
                    chats.append(Chat(id: chatId, friend: friend, messages: messages.sorted {$0.timestamp < $1.timestamp }))
                } else {
                    chats.append(Chat(id: chatId, friend: friend, messages: []))
                }
                dispatchGroup.leave()
            }, withCancel: { error in
                print(error.localizedDescription)
                success = false
                dispatchGroup.leave()
            })
        }
        dispatchGroup.notify(queue: .main, execute: {
            System.chats = chats
            completion(success)
        })
    }
    
    static func findUsers(input: String, completion: @escaping ([String]) -> Void) {
        ref.child("users").queryOrderedByKey().queryStarting(atValue: input).queryEnding(atValue: "\(input)\u{f88f}").observeSingleEvent(of: .value) { (snapshot) in
            print(snapshot)
            if let usersDict = snapshot.value as? [String: Any] {
                let results = usersDict.map { (user, _) in user }
                completion(results.filter { System.isNew(user: $0) })
                return
            }
            completion([])
        }
    }
    
    
    static func addFriend(friend: String, completion: @escaping (Bool) -> Void) {
        ref.child("chats").childByAutoId().updateChildValues(["messages": true]) { (error, reference) in
            if let _ = error {
                completion(false)
                return
            }
            let chatId = reference.key as! String
            guard let currentUser = System.currentUser?.replacingOccurrences(of: ".", with: "") else { return }
            let updates = [
                "user/\(friend)/chats": [chatId: currentUser],
                "user/\(currentUser)/chats": [chatId: friend]
            ]
            ref.updateChildValues(updates)
            completion(true)
        }
    }
    
    static func sendMessage(chatId: String, message: Message) {
        
    }
    
    static func updateRead(chatId: String, message: Message) {
        
    }
}
