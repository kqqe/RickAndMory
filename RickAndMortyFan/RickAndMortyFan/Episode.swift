//
//  Episode.swift
//  RickAndMortyFan
//
//  Created by Острожный Анатолий on 04.08.2020.
//  Copyright © 2020 Sberbank. All rights reserved.
//

import Foundation

/// Модель, описывающая один эпизод
struct Episode: Decodable {
    let id: Int
    let name: String
    let airDate: String
    let episode: String
    let characters: [String]
    let url: String
    let created: String
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case airDate = "air_date"
        case episode, characters, url, created
    }
    
    //MARK: - Init
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        airDate = try container.decode(String.self, forKey: .airDate)
        episode = try container.decode(String.self, forKey: .episode)
        characters = try container.decode([String].self, forKey: .characters)
        url = try container.decode(String.self, forKey: .url)
        created = try container.decode(String.self, forKey: .created)
    }
}

/// Модель с данными о последующих локациях
struct InfoEpisode: Decodable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}

struct MainEpisode: Decodable {
    let info: InfoEpisode
    let results: [Episode]?
}
