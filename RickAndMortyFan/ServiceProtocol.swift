//
//  ServiceProtocol.swift
//  RickAndMortyFan
//
//  Created by Острожный Анатолий on 07.09.2020.
//  Copyright © 2020 Anatoliy. All rights reserved.
//

import Foundation

/// Исходящий протокол Service
protocol ServiceInput: AnyObject {
    
    /// Запрос на характеристику персонажа
    func requestCharacterList(urlString: String?)
    
    /// Запрос на локацию описывающее метоположение персонажа
    func requestLocationList(urlString: String?)
    
    /// Запрос на эпизод
    func requestEpisodeList(urlString: String?)
    
    /// Запрос на базовые API
    func requestUrls()
}

/// Входящие события Service
protocol ServiceOutput: AnyObject {
    
    ///Получен URL основных модделей
    func didReceive(_ characters: UrlsApiModel?)
    
    /// Получена ошибка с запроса
    func didReceive(_ error: Error)
    
    /// Получена модель харктеристик персонажей
    func didReceiveCharacters(_ model: MainCharacters)
    
    /// Получена модель эпизодов
    func didReceiveEpisode(_ model: MainEpisode)
    
    /// Получена модель местонаходения персонажей
    func didReceiveLocation(_ model: MainLocation)
}
