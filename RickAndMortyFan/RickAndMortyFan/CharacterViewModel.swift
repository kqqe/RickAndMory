//
//  CharacterViewModel.swift
//  RickAndMortyFan
//
//  Created by Острожный Анатолий on 16.09.2020.
//  Copyright © 2020 Anatoliy. All rights reserved.
//

import Foundation

/// Модель, описывающая персонажа
struct CharacterViewModel {
	
	/// Идентификатор персонажа
    let id: Int
	
	/// Имя персонажа
    let name: String
	
	/// Статус персонажа (жив или нет)
    let status: String
	
	/// Статус персонажа ("живой", "мертвый" или "неизвестный").
    let species: String
	
	/// Тип или подвид персонажа
    let type: String
	
	/// Исходное имя  местоположение персонажа.
	let origin: String
	
	/// Имя на последнюю известную конечную точку местоположения персонажа.
	let location: String
	
	/// Пол персонажа ("женский", "мужской", "бесполый" или "неизвестный").
    let gender: String
	
	/// Аватар для персонажа
    let image: String
    	
}
