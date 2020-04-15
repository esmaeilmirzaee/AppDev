//
//  NetworkManager.swift
//  AppDev
//
//  Created by Esmaeil MIRZAEE on 2020-04-12.
//  Copyright © 2020 TheBeaver. All rights reserved.
//

import Foundation
import Alamofire

let endpoint = "https://mindylou.github.io/classes.json"

class NetworkManager {
    static func getClasses(completion: @escaping ([Course]) -> Void) {
        AF.request(endpoint, method: .get).validate().responseData { (response) in
            switch response.result {
            case .success(let data):
                print(response)
                let jsonDecoder = JSONDecoder()
                if let courseResponse = try? jsonDecoder.decode(CourseResponse.self, from: data) {
                    let classes = courseResponse.data.classes
                    completion(classes)
                } else {
                    print("Invalid response data")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
