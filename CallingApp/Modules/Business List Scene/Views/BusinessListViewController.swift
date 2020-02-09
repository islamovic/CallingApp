//
//  BusinessListViewController.swift
//  CallingApp
//
//  Created by Islam on 2/9/20.
//  Copyright © 2020 App Lineup. All rights reserved.
//

import UIKit

class BusinessListViewController: UIViewController {

    var interactor: BusinessListSceneBusinessLogic!
    var dataStore: BusinessListSceneDataStore!
    var router:  BusinessListSceneRouter!

    override func viewDidLoad() {
        super.viewDidLoad()

        interactor.fetchBusinessList(input: "ezzat")
    }
}

extension BusinessListViewController: BusinessListSceneDisplayView {

    func display(viewModel: BusinessListScene.ViewModel) {
        print(viewModel.business)
    }

    func display(error: CustomError) {
        print(error.localizedDescription)
    }
}
