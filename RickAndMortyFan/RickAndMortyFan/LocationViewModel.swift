//
//  LocationViewModel.swift
//  RickAndMortyFan
//
//  Created by Острожный Анатолий on 16.09.2020.
//  Copyright © 2020 Anatoliy. All rights reserved.
//

import Foundation

/// Модель описывающая метстоположения персонажа
struct LocationViewModel {
	
	/// Название локации
	let name: String
	
	/// Тип локации
	let type: String
	
	/// Измерение, в котором находится местоположение
	let dimension: String
	
	/// Время, в которое местоположение было создано в базе данных
	let createdTime: String
	 
}
