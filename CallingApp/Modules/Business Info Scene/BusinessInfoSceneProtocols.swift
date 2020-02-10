//
//  BusinessInfoSceneProtocols.swift
//  CallingApp
//
//  Created by Islam on 2/9/20.
//  Copyright © 2020 App Lineup. All rights reserved.
//

import UIKit

// MARK: - View
protocol BusinessInfoSceneDisplayView: class {
    func display(viewModel: BusinessInfoScene.ViewModel)
    func display(error: CustomError)
}

// MARK: - Interactor
protocol BusinessInfoSceneBusinessLogic: class {
    func fetchBusinessInfo(placeId: String)
}

// MARK: - Presenter
protocol BusinessInfoScenePresentingLogic: class {
    func presentFetchedBusiness(_ response: BusinessInfoScene.Fetch.Response)
}

protocol BusinessInfoSceneDataStore: class {
    var business: Business { get set }
}

// MARK: - Functionalities
enum BusinessInfoScene {
    struct ViewModel {
        let business: Business
    }
}

extension BusinessInfoScene {
    enum Fetch { }
}

extension BusinessInfoScene.Fetch {
    typealias Response = Result<Business, CustomError>
}
