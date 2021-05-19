//
//  MainScreenViewProtocol.swift
//  RickAndMortyFan
//
//  Created by Острожный Анатолий on 03.08.2020.
//  Copyright © 2020 Anatoliy. All rights reserved.
//

/// Исходящие события Main Screen View
protocol MainScreenViewOutput {
	
	/// Была нажата кнопка
	func didTapShowAllButton()
	
	/// Настроить конфиуграцию View
	func configureView()
    
    func tap()
}

/// Входящие события Main Screen View
protocol MainScreenViewInput: AnyObject {
	
	/// Настроить навигейшн бар
	func setupNavBar(with title: String)
	
	/// сохранить модель местонахождения персонажа
	func saveLocationViewModels(_ viewModels: [LocationViewModel])
	
	/// сохранить модель персонажей
	func saveCharacterViewModels(_ viewModels: [CharacterViewModel])
	
	/// сохранить модель эпизодов
	func saveEpisodeViewModels(_ viewModels: [EpisodeViewModel])
}
