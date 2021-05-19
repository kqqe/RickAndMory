//
//  Assembly.swift
//  RickAndMortyFan
//
//  Created by Острожный Анатолий on 28.08.2020.
//  Copyright © 2020 Anatoliy. All rights reserved.
//

import Foundation
import UIKit

/// Собирает все части вместе и возвращает текущий UIViewController
final class Assembly {
    weak var flowCoordinator: FlowCoordinator?
    
    //MARK: - MakeMainScreenScene
    func makeMainScreenScene() -> MainScreenViewController {
        let vc = MainScreenViewController()
        let presenter = MainScreenPresenter()
        vc.output = presenter
        presenter.view = vc
        presenter.output = flowCoordinator
        flowCoordinator?.mainScreenPresenter = presenter
        return vc
    }
    
    //MARK: - MakeListScreenScene
    func makeListScreenScene() -> ListViewController {
        let vc = ListViewController()
        let presenter = ListViewPresenter()
        vc.output = presenter
        presenter.view = vc
        presenter.output = flowCoordinator
        flowCoordinator?.listViewScreenPresenter = presenter
        return vc
    }
    
    //MARK: - MakeDetailInfoScene
    func makeDetailInfoScene() -> DetailInfoViewController {
        let vc = DetailInfoViewController()
        let presenter = DetailInfoPresenter()
        vc.output = presenter
        presenter.view = vc
        presenter.output = flowCoordinator
        flowCoordinator?.detailInfoPresenter = presenter
        return vc
    }
    
    //MARK: - MakeFlowCoordinator
    func makeFlowCoordinator(with navigationController: UINavigationController) -> FlowCoordinator {
        let coordinator = FlowCoordinator()
		self.flowCoordinator = coordinator
        let router = Router()
        router.assembly = self
        router.navigatorController = navigationController
        coordinator.router = router
        coordinator.interactor = featureInteractor()
        return coordinator
    }
    
	//MARK: - FeatureInteractor
	private func featureInteractor() -> Interactor {
		let interactor = Interactor()
        let service = Service()
		service.output = interactor
		interactor.output = self.flowCoordinator
        interactor.service = service
		return interactor
    }
}
