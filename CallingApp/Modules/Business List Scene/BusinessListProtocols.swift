//
//  BusinessListProtocols.swift
//  CallingApp
//
//  Created by Islam on 2/9/20.
//  Copyright © 2020 App Lineup. All rights reserved.
//

import UIKit

// MARK: - View
protocol BusinessListSceneDisplayView: class {
    func display(viewModel: BusinessListScene.ViewModel)
    func display(error: CustomError)
}

// MARK: - Interactor
protocol BusinessListSceneBusinessLogic: class {
    func fetchBusinessList(input: String)
}

// MARK: - Presenter
protocol BusinessListScenePresentingLogic: class {
    func presentFetchedBusiness(_ response: BusinessListScene.Fetch.Response)
}

// MARK: - Router
protocol BusinessListSceneRoutingLogic: class {
    var viewController: (BusinessListSceneDisplayView & UIViewController)? { get set }
    var dataStore: BusinessListSceneDataStore? { get set }
    func routeToBusinessInformation(business: Business)
}

protocol BusinessListSceneDataStore: class {
    var businesses: [Business] { get set }
}

// MARK: - Functionalities
enum BusinessListScene {
    struct ViewModel {
        let business: [Business]
    }
}

extension BusinessListScene {
    enum Fetch { }
}

extension BusinessListScene.Fetch {
    typealias Response = Result<[Business], CustomError>
}
