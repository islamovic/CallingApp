//
//  BusinessInfoViewController.swift
//  CallingApp
//
//  Created by Islam on 2/9/20.
//  Copyright © 2020 App Lineup. All rights reserved.
//

import UIKit

class BusinessInfoViewController: UIViewController {

    var interactor: BusinessInfoSceneBusinessLogic!
    var dataStore: BusinessInfoSceneDataStore!

    override func viewDidLoad() {
        super.viewDidLoad()
        if let business = dataStore.business {
            print(business.description)
        }
    }
}

extension BusinessInfoViewController: BusinessInfoSceneDisplayView {

    func display(viewModel: BusinessInfoScene.ViewModel) {

    }

    func display(error: CustomError) {
        
    }
}
