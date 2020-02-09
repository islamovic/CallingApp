//
//  BusinessInfoSceneInteractor.swift
//  CallingApp
//
//  Created by Islam on 2/9/20.
//  Copyright © 2020 App Lineup. All rights reserved.
//

import Foundation

class BusinessInfoSceneInteractor: BusinessInfoSceneBusinessLogic, BusinessInfoSceneDataStore {

    // MARK: Stored Properties
    let presenter: BusinessInfoScenePresentingLogic
    var worker = BusinessInfoSceneWorker()

    // MARK: Data Store
    var business: Business?

    // MARK: Initializers
    required init(presenter: BusinessInfoScenePresentingLogic) {
        self.presenter = presenter
    }
}

extension BusinessInfoSceneInteractor {

    func fetchBusinessInfo(placeId: String) {

        worker.fetchBusiness(placeId: placeId) { [weak self] (business, error) in

            guard let `self` = self else { return }

            if let error = error {
                let response = BusinessInfoScene.Fetch.Response.error(error)
                self.presenter.presentFetchedBusiness(response)
            } else if let business = business {
                let response = BusinessInfoScene.Fetch.Response.success(business)
                self.presenter.presentFetchedBusiness(response)
            }

        }
    }
}
