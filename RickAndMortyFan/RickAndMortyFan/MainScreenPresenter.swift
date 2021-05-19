//
//  MainScreenPresenter.swift
//  RickAndMortyFan
//
//  Created by Острожный Анатолий on 03.08.2020.
//  Copyright © 2020 Anatoliy. All rights reserved.
//

import Foundation

// Презентер главного экрана
final class MainScreenPresenter: NSObject {
	weak var view: MainScreenViewInput?
	var output: MainScreenPresenterOutput?
}

// MARK: - MainScreenPresenterInput
extension MainScreenPresenter: MainScreenPresenterInput {
	func presentContent(_ contentModel: MainSceneContentModel) {
		if let locations = contentModel.locations {
			let locationViewModels = locations.compactMap { location in
				LocationViewModel(name: location.name,
								  type: location.type,
								  dimension: location.dimension,
								  createdTime: location.createdTime)
			}
			view?.saveLocationViewModels(locationViewModels)
		}
		
		if let characters = contentModel.characters {
			let chatacterViewModels = characters.compactMap { characters in
				CharacterViewModel(id: characters.id,
								   name: characters.name,
								   status: characters.status,
								   species: characters.species,
								   type: characters.type,
								   origin: characters.origin.name,
								   location:characters.location.name,
								   gender: characters.gender,
								   image: characters.image)
			}
			view?.saveCharacterViewModels(chatacterViewModels)
		}
		
		if let episodes = contentModel.episodes {
			let episodeViewModels = episodes.compactMap { episodes in
				EpisodeViewModel(id: episodes.id,
								 name: episodes.name,
								 airDate: episodes.airDate,
								 episode: episodes.episode,
								 url: episodes.url,
								 created: episodes.created)
			}
			view?.saveEpisodeViewModels(episodeViewModels)
		}
	}
}

// MARK: - MainScreenPresenterOutput
extension MainScreenPresenter: MainScreenViewOutput {
    func tap() {
        output?.tap2()
    }
    
	
	func didTapShowAllButton() {
		output?.didTapShowAllButton()
	}

	func configureView() {
		output?.obtainData()
		view?.setupNavBar(with: "Details")
	}
}
