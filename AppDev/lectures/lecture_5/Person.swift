//
//  Person.swift
//  AppDev
//
//  Created by Esmaeil MIRZAEE on 2020-04-11.
//  Copyright © 2020 TheBeaver. All rights reserved.
//

import Foundation
import UIKit

class Person {
    let profileImage: UIImage?
    
    init(imageName: String) {
        self.profileImage = UIImage(named: imageName)
    }
}
