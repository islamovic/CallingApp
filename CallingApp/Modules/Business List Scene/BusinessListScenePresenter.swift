//
//  BusinessListScenePresenter.swift
//  CallingApp
//
//  Created by Islam on 2/9/20.
//  Copyright © 2020 App Lineup. All rights reserved.
//

import Foundation

class BusinessListScenePresenter: BusinessListScenePresentingLogic {

    // MARK: Stored Properties
    weak var displayView: BusinessListSceneDisplayView?

    // MARK: Initializers
    required init(displayView: BusinessListSceneDisplayView) {
        self.displayView = displayView
    }
}

extension BusinessListScenePresenter {

    func presentFetchedBusiness(_ response: BusinessListScene.Fetch.Response) {

        switch response {
            case .success(let businesses):
                let viewModel = BusinessListScene.ViewModel(business: businesses)
                displayView?.display(viewModel: viewModel)
            case .error(let error):
                displayView?.display(error: error)
        }
    }
}
