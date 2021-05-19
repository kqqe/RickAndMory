//
//  InteractorProtocol.swift
//  RickAndMortyFan
//
//  Created by Острожный Анатолий on 07.09.2020.
//  Copyright © 2020 Anatoliy. All rights reserved.
//

import Foundation

/// Исходящие события InteractorOutput
protocol InteractorOutput: AnyObject {
    
    ///Получена модель с данными для отображения на главном экране
    func didReceive(_ contentModel: MainSceneContentModel)
}

/// Входящие события IntecactorInput
protocol InteractorInput {
    
    /// Запрос данных с API
    func requestData()
}
