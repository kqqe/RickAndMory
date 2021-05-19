//
//  RouterProtocol.swift
//  RickAndMortyFan
//
//  Created by Острожный Анатолий on 28.08.2020.
//  Copyright © 2020 Anatoliy. All rights reserved.
//

import Foundation
/// Входящие события Router
protocol RouterInput: AnyObject {
   
    /// Маршрут для создания главного экрана
    func routeToMakeScreenVC()
    
    /// Маршрут для создания  экрана о списком
    func routeToListScene()
    
    /// Маршрут для создания детального экрана отображения персонажей
    func routeDetailInfoScene()
}
