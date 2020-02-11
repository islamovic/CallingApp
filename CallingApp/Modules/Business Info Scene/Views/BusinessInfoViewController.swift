//
//  BusinessInfoViewController.swift
//  CallingApp
//
//  Created by Islam on 2/9/20.
//  Copyright © 2020 App Lineup. All rights reserved.
//

import UIKit

class BusinessInfoViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    var interactor: BusinessInfoSceneBusinessLogic!
    var dataStore: BusinessInfoSceneDataStore!

    var dataSource = [BusinessInfoDataSource]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()

        if let placeId = dataStore.business.placeId {
            interactor.fetchBusinessInfo(placeId: placeId)
        }
    }
}

extension BusinessInfoViewController: BusinessInfoSceneDisplayView {

    func display(viewModel: BusinessInfoScene.ViewModel) {
        dataStore.business = viewModel.business
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }

    func display(error: CustomError) {
        print(error.localizedDescription)
    }
}


extension BusinessInfoViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count > 0 ? dataSource[section].numberOfRows() : 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return dataSource[indexPath.section].cellForRow(at: indexPath, tableView: tableView, business: dataStore.business)
    }
}

extension BusinessInfoViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return dataSource[indexPath.section].heightForInfo()
    }
}

private extension BusinessInfoViewController {

    func setup() {
        setupTableView()
        setupDataSource()
        self.title = dataStore.business.name ?? "Info"
    }

    func setupDataSource() {
        dataSource = [BusinessInfoMap(), BusinessDetails()]
    }

    func setupTableView() {

        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44

        tableView.register(LocationCell.self)
        tableView.register(DetailsCell.self)

        tableView.dataSource = self
        tableView.delegate = self

        tableView.tableFooterView = UIView(frame: .zero)
    }
}
