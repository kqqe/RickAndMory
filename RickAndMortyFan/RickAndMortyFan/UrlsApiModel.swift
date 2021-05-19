//
//  UrlsApiModel.swift
//  RickAndMortyFan
//
//  Created by Острожный Анатолий on 09.09.2020.
//  Copyright © 2020 Sberbank. All rights reserved.
//

import Foundation

/// Модель для всех доступных базовых API
struct UrlsApiModel: Decodable {
    let charactersUrlString: String
    let locationsUrlString: String
    let episodesUrlString: String
    
    enum CodingKeys: String, CodingKey {
        case charactersUrlString = "characters"
        case locationsUrlString = "locations"
        case episodesUrlString = "episodes"
    }
    
    // MARK: - INIT
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        charactersUrlString = try container.decode(String.self, forKey: .charactersUrlString)
        locationsUrlString = try container.decode(String.self, forKey: .locationsUrlString)
        episodesUrlString = try container.decode(String.self, forKey: .episodesUrlString)
    }
}
