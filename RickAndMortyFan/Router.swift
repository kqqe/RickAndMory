//
//  Router.swift
//  RickAndMortyFan
//
//  Created by Острожный Анатолий on 28.08.2020.
//  Copyright © 2020 Anatoliy. All rights reserved.
//

import Foundation
import UIKit

/// Отвечает за переход на следующий UIViewController, полученный от Assembly.
final class Router {
    var assembly: Assembly?
    var navigatorController: UINavigationController?
}

//MARK: - RouterInput
extension Router: RouterInput {
    
    func routeToMakeScreenVC() {
        let vc = assembly?.makeMainScreenScene()
        if let viewContoller = vc {
            self.navigatorController?.pushViewController(viewContoller, animated: true)
        }
    }
    
    func routeToListScene() {
        let vc = assembly?.makeListScreenScene()
        if let viewController = vc {
            self.navigatorController? .pushViewController(viewController, animated: true)
        }
    }
    
    func routeDetailInfoScene() {
        let vc = assembly?.makeDetailInfoScene()
        if let viewController = vc {
            self.navigatorController?.pushViewController(viewController, animated: true)
        }
    }
}
