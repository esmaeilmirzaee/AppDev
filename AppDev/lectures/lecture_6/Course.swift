//
//  Course.swift
//  AppDev
//
//  Created by Esmaeil MIRZAEE on 2020-04-12.
//  Copyright © 2020 TheBeaver. All rights reserved.
//

import Foundation

struct Course: Codable {
    var name: String
    var code: Int
    var instructor: String
    var enrolled: Bool
}

struct CourseDataRespone: Codable {
    var classes: [Course]
}

struct CourseResponse: Codable {
    var data: CourseDataRespone
}
