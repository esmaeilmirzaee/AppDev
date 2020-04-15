//
//  System.swift
//  AppDev
//
//  Created by Esmaeil MIRZAEE on 2020-04-13.
//  Copyright © 2020 TheBeaver. All rights reserved.
//

import Foundation

class System {
    static var chats = [Chat]()
    static var currentUser: String?
    
    static func isNew(user: String) -> Bool {
        if currentUser! == user { return false }
        return !chats.contains { chat in chat.friend == user }
    }
}
