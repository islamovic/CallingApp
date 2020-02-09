//
//  BusinessInfoSceneConfigurator.swift
//  CallingApp
//
//  Created by Islam on 2/9/20.
//  Copyright © 2020 App Lineup. All rights reserved.
//

import Foundation

class BusinessInfoSceneConfigurator {

    static func configure() -> BusinessInfoViewController {

        let viewController = BusinessInfoViewController()

        let presenter = BusinessInfoScenePresenter(displayView: viewController)
        let interactor = BusinessInfoSceneInteractor(presenter: presenter)
        viewController.interactor = interactor
        viewController.dataStore = interactor

        return viewController
    }
}
