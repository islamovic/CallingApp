//
//  BusinessListSceneInteractor.swift
//  CallingApp
//
//  Created by Islam on 2/9/20.
//  Copyright © 2020 App Lineup. All rights reserved.
//

import Foundation

class BusinessListSceneInteractor: BusinessListSceneBusinessLogic, BusinessListSceneDataStore {

    // MARK: Stored Properties
    let presenter: BusinessListScenePresentingLogic
    var worker = BusinessListSceneWorker()

    // MARK: Data Store
    var businesses: [Business]

    // MARK: Initializers
    required init(presenter: BusinessListScenePresentingLogic) {
        self.presenter = presenter
        self.businesses = []
    }
}

extension BusinessListSceneInteractor {

    func fetchBusinessList(input: String) {
        worker.fetchBusiness(input: input) { [weak self] (businesses, error) in

            guard let `self` = self else { return }

            if let error = error {
                let response = BusinessListScene.Fetch.Response.error(error)
                self.presenter.presentFetchedBusiness(response)
            } else {
                self.businesses = businesses
                let response = BusinessListScene.Fetch.Response.success(businesses)
                self.presenter.presentFetchedBusiness(response)
            }
        }
    }

    // MARK: - For Testing
    func fetchBusinesses(input: String) {

        if !businesses.isEmpty {
            let results = businesses.filter { $0.name!.contains(input) }
            let response = BusinessListScene.Fetch.Response.success(results)
            self.presenter.presentFetchedBusiness(response)
            return
        }
    }

}
