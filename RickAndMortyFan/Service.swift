//
//  Service.swift
//  RickAndMortyFan
//
//  Created by Острожный Анатолий on 07.09.2020.
//  Copyright © 2020 Anatoliy. All rights reserved.
//

import Foundation

/// Выполняет запрос в сеть
final class Service: ServiceInput {
    
    weak var output: ServiceOutput?

    func requestCharacterList(urlString: String?) {
        let session = URLSession.shared
        guard let unwrappedURLString = urlString,
            let url = URL(string: unwrappedURLString) else { return }
        let task = session.dataTask(with: url, completionHandler: { data, response, error in
            if error != nil {
                return
            }
            do {
                let character = try JSONDecoder().decode(MainCharacters.self, from: data!)
                self.output?.didReceiveCharacters(character)
            } catch {
                self.output?.didReceive(error)
            }
        })
        task.resume()
    }
    
    func requestLocationList(urlString: String?) {
        let session = URLSession.shared
        guard let unwrappedURLString = urlString,
            let url = URL(string: unwrappedURLString) else { return }
        let task = session.dataTask(with: url, completionHandler: {data, response, error in
            if error != nil {
                return
            }
            do {
                let location = try JSONDecoder().decode(MainLocation.self, from: data!)
                self.output?.didReceiveLocation(location)
            } catch {
                self.output?.didReceive(error)
            }
        })
        task.resume()
    }
    
    func requestEpisodeList(urlString: String?) {
        let session = URLSession.shared
        guard let unwrappedURLString = urlString,
            let url = URL(string: unwrappedURLString) else { return }
        let task = session.dataTask(with: url, completionHandler: {data, response, error in
            if error != nil {
                return
            }
            do {
                let episode = try JSONDecoder().decode(MainEpisode.self, from: data!)
                self.output?.didReceiveEpisode(episode)
            } catch {
                self.output?.didReceive(error)
            }
        })
        task.resume()
    }
    
    func requestUrls() {
        let session = URLSession.shared
        guard let url = URL(string: "https://rickandmortyapi.com/api/") else { return }
        let task = session.dataTask(with: url, completionHandler: {data, response, error in
            if error != nil {
                return
            }
            do {
                let urlModel = try JSONDecoder().decode(UrlsApiModel.self, from: data!)
                self.output?.didReceive(urlModel)
            } catch {
                self.output?.didReceive(error)
            }
        })
        task.resume()
    }
}
