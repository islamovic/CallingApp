//
//  BusinessInfoDataSource.swift
//  CallingApp
//
//  Created by Islam on 2/11/20.
//  Copyright © 2020 App Lineup. All rights reserved.
//

import UIKit

protocol BusinessInfoDataSource {
    func numberOfRows() -> Int
    func cellForRow(at indexPath: IndexPath, tableView: UITableView, business: Business) -> UITableViewCell
    func heightForInfo() -> CGFloat
}
