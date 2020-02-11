//
//  BusinessInfoMap.swift
//  CallingApp
//
//  Created by Islam on 2/11/20.
//  Copyright © 2020 App Lineup. All rights reserved.
//

import UIKit

class BusinessInfoMap: BusinessInfoDataSource {

    func numberOfRows() -> Int {
        return 1
    }

    func cellForRow(at indexPath: IndexPath, tableView: UITableView, business: Business) -> UITableViewCell {
        let cell: LocationCell = tableView.dequeueReusableCell(indexPath: indexPath)
        cell.configure(business: business)
        return cell
    }

    func heightForInfo() -> CGFloat {
        return 300.0
    }
}
