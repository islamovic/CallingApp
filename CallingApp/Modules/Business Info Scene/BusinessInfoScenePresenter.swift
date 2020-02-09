//
//  BusinessInfoScenePresenter.swift
//  CallingApp
//
//  Created by Islam on 2/9/20.
//  Copyright © 2020 App Lineup. All rights reserved.
//

import Foundation

class BusinessInfoScenePresenter: BusinessInfoScenePresentingLogic {

    // MARK: Stored Properties
    weak var displayView: BusinessInfoSceneDisplayView?

    // MARK: Initializers
    required init(displayView: BusinessInfoSceneDisplayView) {
        self.displayView = displayView
    }
}

extension BusinessInfoScenePresenter {

    func presentFetchedBusiness(_ response: BusinessInfoScene.Fetch.Response) {

        switch response {
            case .success(let businesses):
                let viewModel = BusinessInfoScene.ViewModel(business: businesses)
                displayView?.display(viewModel: viewModel)
            case .error(let error):
                displayView?.display(error: error)
        }
    }
}
