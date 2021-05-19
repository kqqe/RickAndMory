//
//  Interactor.swift
//  RickAndMortyFan
//
//  Created by Острожный Анатолий on 07.09.2020.
//  Copyright © 2020 Anatoliy. All rights reserved.
//

import Foundation

/// Взаимодействует с сервисами через протоколы и выдает данные наружу
final class Interactor {
    weak var output: InteractorOutput?
    var service: ServiceInput?
	private var contentModel: MainSceneContentModel?
    private var urlApiModel: UrlsApiModel?
}

//MARK: - InteractorInput
extension Interactor: InteractorInput {
    func requestData() {
        service?.requestUrls()
    }
}

// MARK: - ServiceOutput
extension Interactor: ServiceOutput {
    
    func didReceive(_ error: Error) {
         print("Error during JSON serialization: \(error.localizedDescription)")
    }
    
    func didReceive(_ urlApiModel: UrlsApiModel?) {
        guard let model = urlApiModel else { return }
		contentModel = MainSceneContentModel()
        self.urlApiModel = model
        service?.requestCharacterList(urlString: model.charactersUrlString)
    }
    
    func didReceiveCharacters(_ model: MainCharacters) {
        guard let urlApi = urlApiModel else { return }
        contentModel?.characters = model.results
        service?.requestEpisodeList(urlString: urlApi.episodesUrlString)
    }

    func didReceiveEpisode(_ model: MainEpisode){
        guard let urlApi = urlApiModel else { return }
        contentModel?.episodes = model.results
        service?.requestLocationList(urlString: urlApi.locationsUrlString)
    }
    
    func didReceiveLocation(_ model: MainLocation){
		contentModel?.locations = model.results
		guard let contentModel = self.contentModel else { return }
		output?.didReceive(contentModel)
    }
}
