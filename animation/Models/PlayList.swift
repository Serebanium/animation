//
//  PlayList.swift
//  animation
//
//  Created by Сергей Иванов on 04/04/2019.
//  Copyright © 2019 topMob. All rights reserved.
//

import Foundation

struct PlayList: Codable {
    let results: [TrackOpt]
}

struct TrackOpt: Codable {
    var name: String
    var artist: String
    var previewUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "trackName"
        case artist = "artistName"
        case previewUrl
    }
    
    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        
        name = try valueContainer.decode(String.self, forKey: CodingKeys.name)
        artist = try valueContainer.decode(String.self, forKey: CodingKeys.artist)
        previewUrl = try? valueContainer.decode(String.self, forKey: CodingKeys.previewUrl)
    }
}

struct  Track {
    var name: String
    var artist: String
    var previewUrl: String
}
