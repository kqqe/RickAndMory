//
//  EpisodeViewModel.swift
//  RickAndMortyFan
//
//  Created by Острожный Анатолий on 16.09.2020.
//  Copyright © 2020 Anatoliy. All rights reserved.
//

import Foundation

///Модель описывающая эпизод
struct EpisodeViewModel {
	
	/// Идентификатор эпизода
	let id: Int
	
	/// Название эпизода
	let name: String
	
	/// Дата выхода в эфир этого эпизода
	let airDate: String
	
	/// Код эпизода
	let episode: String
	
	/// Ссылка на собственную конечную точку эпизода
	let url: String
	
	/// Время, когда эпизод был создан в базе данных
	let created: String
	
}
