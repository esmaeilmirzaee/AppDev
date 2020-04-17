//
//  Song.swift
//  AppDev
//
//  Created by Esmaeil MIRZAEE on 2020-04-16.
//  Copyright © 2020 TheBeaver. All rights reserved.
//

import UIKit

class Song: NSObject, Codable {
    var name: String
    var artist: String
    var album: String
    var imageName: String
    var isFavourite: Bool
    
    init(name: String, artist: String, album: String, imageName: String, isFavourite: Bool) {
        self.name = name
        self.artist = artist
        self.album = album
        self.imageName = imageName
        self.isFavourite = isFavourite
    }
/*
    private enum CodingKeys: CodingKey {
        case name, artist, album, imageData, isFavourite
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(String.self, forKey: .name)
        album = try values.decode(String.self, forKey: .album)
        isFavourite = try values.decode(Bool.self, forKey: .isFavourite)
        
        if let imageData = try values.decodeIfPresent(Data.self, forKey: .imageData) {
            image = NSKeyedUnarchiver.unarchiveObject(with: imageData) as? UIImage
        } else {
            image = nil
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(artist, forKey: .artist)
        try container.encode(album, forKey: .album)
        try container.encode(isFavourite, forKey: .isFavourite)
        
        if let image = image {
            let imageData = NSKeyedArchiver.archivedData(withRootObject: image)
            try container.encode(imageData, forKey: .imageData)
        }
    }
    */
}
