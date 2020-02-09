//
//  BusinessListViewController.swift
//  CallingApp
//
//  Created by Islam on 2/9/20.
//  Copyright © 2020 App Lineup. All rights reserved.
//

import UIKit

protocol BusinessListDelegate: class {
    func didSelect(business: Business)
}

class BusinessListViewController: UIViewController {

    @IBOutlet var tableView: UITableView!

    let searchController = UISearchController(searchResultsController: nil)
    
    var interactor: BusinessListSceneBusinessLogic!
    var dataStore: BusinessListSceneDataStore!
    var router:  BusinessListSceneRouter!

    weak var delegate: BusinessListDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
}

extension BusinessListViewController: BusinessListSceneDisplayView {

    func display(viewModel: BusinessListScene.ViewModel) {

        dataStore.businesses = viewModel.business
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }

    func display(error: CustomError) {
        print(error.localizedDescription)
    }
}

extension BusinessListViewController: UISearchBarDelegate {

    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        if let keyword = searchBar.text, !keyword.isEmpty {
            interactor.fetchBusinessList(input: keyword)
        }
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        interactor.fetchBusinessList(input: searchText)
    }

    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        interactor.fetchBusinessList(input: searchBar.text ?? "")
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        dataStore.businesses = []
        tableView.reloadData()
    }
}

extension BusinessListViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataStore.businesses.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let identifier = String(describing: BusinessCell.self)
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! BusinessCell
        cell.configure(business: dataStore.businesses[indexPath.row])
        return cell
    }
}

extension BusinessListViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        router.routeToBusinessInformation(business: dataStore.businesses[indexPath.row])
    }
}

private extension BusinessListViewController {

    func setup() {
        setupTableView()
        setupSearchController()
        self.title = "Business"
    }

    func setupTableView() {

        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44

        let identifier = String(describing: BusinessCell.self)
        let nib = UINib(nibName: identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: identifier)

        tableView.dataSource = self
        tableView.delegate = self

        tableView.tableFooterView = UIView(frame: .zero)
    }

    func setupSearchController() {
        searchController.searchBar.placeholder = "Search for a business name"
        if #available(iOS 11.0, *) {
            navigationItem.searchController = searchController
            navigationItem.hidesSearchBarWhenScrolling = false
        } else {
            tableView.tableHeaderView = searchController.searchBar
        }

        searchController.searchBar.delegate = self
        definesPresentationContext = true
        searchController.obscuresBackgroundDuringPresentation = false
    }
}
