//
//  Message.swift
//  AppDev
//
//  Created by Esmaeil MIRZAEE on 2020-04-13.
//  Copyright © 2020 TheBeaver. All rights reserved.
//

import Foundation

class Message {
    var id: String = ""
    var sender: String
    var recipient: String
    var body: String
    var hasRead: Bool
    var timestamp: Double
    
    init(sender: String, recipient: String, body: String, hasRead: Bool, timestamp: Double) {
        self.sender = sender
        self.recipient = recipient
        self.body = body
        self.hasRead = hasRead
        self.timestamp = timestamp
    }
    
    static func fromDatabase(object: [String: Any]) -> Message {
        let sender = object["sender"] as! String
        let recipient = object["recipient"] as! String
        let body = object["body"] as! String
        let hasRead = object["hasRead"] as! Bool
        let timestamp = object["timestamp"] as! Double
        
        return Message(sender: sender, recipient: recipient, body: body, hasRead: hasRead, timestamp: timestamp)
    }
    
    func forDatabase() -> [String: Any] {
        return [
            "sender": sender,
            "recipient": recipient,
            "body": body,
            "hasRead": hasRead,
            "timestamp": timestamp
        ]
    }
}
