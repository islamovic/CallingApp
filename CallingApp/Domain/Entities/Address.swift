//
//  Address.swift
//  CallingApp
//
//  Created by Islam on 2/9/20.
//  Copyright © 2020 App Lineup. All rights reserved.
//

import Foundation

struct Address: Decodable {
    let title: String
    let secondary: String?

    enum CodingKeys: String, CodingKey {
        case title = "main_text"
        case secondary = "secondary_text"
    }
}
