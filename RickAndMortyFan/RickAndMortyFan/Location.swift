//
//  Location.swift
//  RickAndMortyFan
//
//  Created by Острожный Анатолий on 04.08.2020.
//  Copyright © 2020 Sberbank. All rights reserved.
//

import Foundation

/// Модель, описывающая метоположения персонажа
struct Location: Decodable {
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
    let url: String
    let createdTime: String
    
    enum CodingKeys: String, CodingKey {
        case id, name, type, dimension, residents, url
        case createdTime = "created"
    }
    
    //MARK: - Init
    init(from decode: Decoder) throws {
        let container = try decode.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        type = try container.decode(String.self, forKey: .type)
        dimension = try container.decode(String.self, forKey: .dimension)
        residents = try container.decode([String].self, forKey: .residents)
        url = try container.decode(String.self, forKey: .url)
        createdTime = try container.decode(String.self, forKey: .createdTime)
    }
}

/// Модель с данными о последующих локациях
struct InfoLocation: Decodable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}

struct MainLocation: Decodable {
    let info: InfoLocation
    let results: [Location]?
}
