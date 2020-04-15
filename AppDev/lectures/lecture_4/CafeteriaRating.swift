//
//  CafetriaRating.swift
//  AppDev
//
//  Created by Esmaeil MIRZAEE on 2020-04-08.
//  Copyright © 2020 TheBeaver. All rights reserved.
//

import Foundation
enum CafeteriaRating {
    case terrible, bad, moderate, good, great, not_tested_yet
}

class Cafeteria {
    let name: String
    var rating: CafeteriaRating
    var isFavourite: Bool

    init(name: String, rating: CafeteriaRating = .not_tested_yet, isFavourite: Bool = false) {
        self.name = name
        self.rating = rating
        self.isFavourite = isFavourite
    }
}
