//
//  ListViewPresenter.swift
//  RickAndMortyFan
//
//  Created by Острожный Анатолий on 02.09.2020.
//  Copyright © 2020 Anatoliy. All rights reserved.
//

import Foundation

/// Презентер для экрана  ListView
final class ListViewPresenter {
    weak var view: ListViewInput?
    var output: ListViewPresenterOutput?
}

//MARK: - ListViewPresenterInput
extension ListViewPresenter: ListViewPresenterInput {

}

//MARK: - ListViewOutput
extension ListViewPresenter: ListViewOutput {
    
}
