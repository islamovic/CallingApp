//
//  UITableView+Utils.swift
//  CallingApp
//
//  Created by Islam on 2/11/20.
//  Copyright © 2020 App Lineup. All rights reserved.
//

import UIKit

public extension UITableView {
    func dequeueReusableCell<T>(indexPath: IndexPath) -> T {
        let identifier = String(describing: T.self)
        guard let cell = dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? T
            else { fatalError("not able to dequeue cell") }
        return cell
    }

    func register(_ klass: AnyClass, identifier: String? = nil) {
        let nibName = String(describing: klass.self)
        let identifier = identifier ?? nibName
        let nib = UINib(nibName: nibName, bundle: nil)
        register(nib, forCellReuseIdentifier: identifier)
    }

    func cellAt<T>(indexPath: IndexPath) -> T {
        guard let cell = cellForRow(at: indexPath) as? T
            else { fatalError("not able to fetch cell at index path") }
        return cell
    }
}
