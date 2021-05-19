//
//  Character.swift
//  RickAndMortyFan
//
//  Created by Острожный Анатолий on 04.08.2020.
//  Copyright © 2020 Sberbank. All rights reserved.
//

import Foundation

/// Модель, описывающая происхождение персонажа
struct CharacterOrigin: Decodable {
    let name: String
    let url: String
}

/// Модель, описывающая метоположение персонажа
struct CharacterLocation: Decodable {
    let name: String
    let url: String
}

/// Модель, описывающая персонажа
struct Character: Decodable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: CharacterOrigin
    let location: CharacterLocation
    let image: String
    let episode: [String]
    let url: String
    let createdTime: String
    
    enum CodingKeys: String, CodingKey {
        case id, name, status, species, type, gender, origin, location, image, episode, url
        case createdTime = "created"
    }
    
    //MARK: - Init
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        status = try container.decode(String.self, forKey: .status)
        species = try container.decode(String.self, forKey: .species)
        type = try container.decode(String.self, forKey: .type)
        gender = try container.decode(String.self, forKey: .gender)
        image = try container.decode(String.self, forKey: .image)
        episode = try container.decode([String].self, forKey: .episode)
        url = try container.decode(String.self, forKey: .url)
        createdTime = try container.decode(String.self, forKey: .createdTime)
        origin = try container.decode(CharacterOrigin.self, forKey: .origin)
        location = try container.decode(CharacterLocation.self, forKey: .location)
    }
}

///  Модель с данными о следующих страницах - характеристик персонажей
struct InfoCharacters: Decodable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}

struct MainCharacters: Decodable {
    let info: InfoCharacters
    let results: [Character]?
}

