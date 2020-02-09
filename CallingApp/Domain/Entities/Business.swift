//
//  Business.swift
//  CallingApp
//
//  Created by Islam on 2/9/20.
//  Copyright © 2020 App Lineup. All rights reserved.
//

import Foundation

struct BusineessList: Decodable {
    let businesses: [Business]

    enum CodingKeys: String, CodingKey {
        case businesses = "predictions"
    }
}

struct Address: Decodable {
    let title: String
    let secondary: String?

    enum CodingKeys: String, CodingKey {
        case title = "main_text"
        case secondary = "secondary_text"
    }
}

struct Business: Decodable {
    let description: String
    let distanceMeters: Double?
    let id: String
    let placeId: String
    let address: Address
    let types: [String]

    enum CodingKeys: String, CodingKey {
        case description
        case distanceMeters = "distance_meters"
        case id
        case placeId = "place_id"
        case address = "structured_formatting"
        case types
    }
}
