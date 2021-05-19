//
//  DetailInfoPreseter.swift
//  RickAndMortyFan
//
//  Created by Острожный Анатолий on 03.09.2020.
//  Copyright © 2020 Anatoliy. All rights reserved.
//

import Foundation

final class DetailInfoPresenter {
    weak var view: DetailInfoInput?
    var output: DetailInfoPresenterOutput?
}

//MARK: - DetailInfoPresenterInput
extension DetailInfoPresenter: DetailInfoPresenterInput {
    
}

//MARK: - DetailsInfoOutput
extension DetailInfoPresenter: DetailInfoOutput {
    
}
