//
//  Chat.swift
//  AppDev
//
//  Created by Esmaeil MIRZAEE on 2020-04-13.
//  Copyright © 2020 TheBeaver. All rights reserved.
//

import Foundation

class Chat {
    var id: String
    var friend: String
    var messages: [Message]
    
    init(id: String, friend: String, messages: [Message]) {
        self.id = id
        self.friend = friend
        self.messages = messages
    }
    
    func mostRecentMessage() -> Message? {
        return messages.last
    }
}
