//
//  BusinessDetails.swift
//  CallingApp
//
//  Created by Islam on 2/11/20.
//  Copyright © 2020 App Lineup. All rights reserved.
//

import UIKit

class BusinessDetails: BusinessInfoDataSource {

    func numberOfRows() -> Int {
        return 1
    }

    func cellForRow(at indexPath: IndexPath, tableView: UITableView, business: Business) -> UITableViewCell {
        let cell: DetailsCell = tableView.dequeueReusableCell(indexPath: indexPath)
        cell.configureCell(business: business)
        return cell
    }

    func heightForInfo() -> CGFloat {
        return UITableView.automaticDimension
    }
}
