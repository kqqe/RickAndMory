//
//  MainScreenPresenterProtocol.swift
//  RickAndMortyFan
//
//  Created by Острожный Анатолий on 03.08.2020.
//  Copyright © 2020 Anatoliy. All rights reserved.
//

import Foundation

/// Исходящие события Main Screen Presenter
protocol MainScreenPresenterOutput {
	func didTapShowAllButton()
	  
	///Запрос на получение данных
	func obtainData()
    
    func tap2()
}

//Входящие события Main Screen Presenter
protocol MainScreenPresenterInput: AnyObject {
	
	/// Отобразить модель данных с массивами: Character, Episode, Location
	func presentContent(_ contentModel: MainSceneContentModel)
}
