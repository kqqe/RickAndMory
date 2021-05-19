//
//  FlowCoordinator.swift
//  RickAndMortyFan
//
//  Created by Острожный Анатолий on 28.08.2020.
//  Copyright © 2020 Anatoliy. All rights reserved.
//

import Foundation

/// Главный координатор приложения
final class FlowCoordinator {
    weak var mainScreenPresenter: MainScreenPresenterInput?
    weak var listViewScreenPresenter: ListViewPresenterInput?
    weak var detailInfoPresenter: DetailInfoPresenterInput?
    var interactor: InteractorInput?
    var router: RouterInput?
    
    //MARK: - Start
    func start() {
        router?.routeToMakeScreenVC()
    }
}

//MARK: - MainScreenPresenterOutput
extension FlowCoordinator: MainScreenPresenterOutput {
    func tap2() {
        router?.routeToListScene()
    }
    
    func didTapShowAllButton() {
        router?.routeToListScene()
    }
	
	func obtainData() {
		interactor?.requestData()
	}
    
}

//MARK: - ListViewPresenterOutput
extension FlowCoordinator: ListViewPresenterOutput {
    
}

//MARK: - DetailInfoPresenterOutput
extension FlowCoordinator: DetailInfoPresenterOutput {
    
}

//MARK: - InteractorOutput
extension FlowCoordinator: InteractorOutput {
	func didReceive(_ contentModel: MainSceneContentModel) {
		mainScreenPresenter?.presentContent(contentModel)
	}
}
