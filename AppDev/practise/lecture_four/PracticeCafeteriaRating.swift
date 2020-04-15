//
//  Cafeteria.swift
//  AppDev
//
//  Created by Esmaeil MIRZAEE on 2020-04-10.
//  Copyright © 2020 TheBeaver. All rights reserved.
//

import Foundation

enum PracticeCafeteriaRating {
    case terrible, bad, moderate, good, best
}

class PracticeCafeteria {
    let name: String
    let rating: PracticeCafeteriaRating
    let isFavourite: Bool
    
    init(name: String, rating: PracticeCafeteriaRating, isFavourite: Bool = false) {
        self.name = name
        self.rating = rating
        self.isFavourite = isFavourite
    }
}
