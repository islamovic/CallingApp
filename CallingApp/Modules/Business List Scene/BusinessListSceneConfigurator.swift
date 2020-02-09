//
//  BusinessListSceneConfigurator.swift
//  CallingApp
//
//  Created by Islam on 2/9/20.
//  Copyright © 2020 App Lineup. All rights reserved.
//

import Foundation

class BusinessListSceneConfigurator {

    static func configure() -> BusinessListViewController {

        let viewController = BusinessListViewController()
        
        let presenter = BusinessListScenePresenter(displayView: viewController)
        let interactor = BusinessListSceneInteractor(presenter: presenter)
        let router = BusinessListSceneRouter(viewController: viewController, dataStore: interactor)
        viewController.interactor = interactor
        viewController.dataStore = interactor
        viewController.router = router

        return viewController
    }
}
