//
//  BusinessListSceneRouter.swift
//  CallingApp
//
//  Created by Islam on 2/9/20.
//  Copyright © 2020 App Lineup. All rights reserved.
//

import UIKit

class BusinessListSceneRouter: BusinessListSceneRoutingLogic {

    weak var viewController: (UIViewController & BusinessListSceneDisplayView)?

    weak var dataStore: BusinessListSceneDataStore?

    required init(viewController: (UIViewController & BusinessListSceneDisplayView), dataStore: BusinessListSceneDataStore) {
        self.viewController = viewController
        self.dataStore = dataStore
    }
}

extension BusinessListSceneRouter {

    func routeToBusinessInformation(business: Business) {

    }
}
