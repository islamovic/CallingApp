//
//  BusinessInfoViewController.swift
//  CallingApp
//
//  Created by Islam on 2/9/20.
//  Copyright © 2020 App Lineup. All rights reserved.
//

import UIKit

protocol BusinessInfoDataSource {
    func numberOfRows() -> Int
    func cellForRow(at indexPath: IndexPath, tableView: UITableView, business: Business) -> UITableViewCell
    func heightForInfo(for tableview: UITableView) -> CGFloat
}

class BusinessInfoMap: BusinessInfoDataSource {

    func numberOfRows() -> Int {
        return 1
    }

    func cellForRow(at indexPath: IndexPath, tableView: UITableView, business: Business) -> UITableViewCell {
        let identifier = String(describing: LocationCell.self)
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! LocationCell
        cell.configure(business: business)
        return cell
    }

    func heightForInfo(for tableview: UITableView) -> CGFloat {
        return 300.0
    }
}

class BusinessDetails: BusinessInfoDataSource {

    func numberOfRows() -> Int {
        return 1
    }

    func cellForRow(at indexPath: IndexPath, tableView: UITableView, business: Business) -> UITableViewCell {
        let identifier = String(describing: DetailsCell.self)
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! DetailsCell
        cell.configureCell(business: business)
        return cell
    }

    func heightForInfo() -> CGFloat {
        return 145.0
    }

    func heightForInfo(for tableview: UITableView) -> CGFloat {
        return UITableView.automaticDimension
    }
}

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
        return dataSource[indexPath.section].heightForInfo(for: tableView)
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
        tableView.estimatedRowHeight = 600

        let identifier = String(describing: LocationCell.self)
        let nib = UINib(nibName: identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: identifier)

        let identifier2 = String(describing: DetailsCell.self)
        let nib2 = UINib(nibName: identifier2, bundle: nil)
        tableView.register(nib2, forCellReuseIdentifier: identifier2)

        tableView.dataSource = self
        tableView.delegate = self

        tableView.tableFooterView = UIView(frame: .zero)
    }
}
