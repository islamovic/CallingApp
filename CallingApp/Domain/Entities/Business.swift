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

struct BusinessResult: Decodable {
    let business: Business

    enum CodingKeys: String, CodingKey {
        case business = "result"
    }
}

struct Business: Decodable {
    let description: String?
    let distanceMeters: Double?
    let formattedAddress: String?
    let id: String?
    let placeId: String?
    let address: Address?
    let geometry: Geometry?
    let icon: String?
    let name: String?
    let rating: Double?
    let url: URL?
    let totalRating: Int?
    let types: [String]
    let phoneNumber: String?

    init(name: String, type: [String], placeId: String) {
        self.name        = name
        self.placeId     = placeId
        self.types       = type
        id               = ""
        icon             = ""
        phoneNumber      = ""
        description      = ""
        url              = URL(string: "")
        formattedAddress = ""
        rating           = 0.0
        totalRating      = 0
        distanceMeters   = 0.0
        address          = nil
        geometry         = nil

    }

    init() {
        description = ""
        distanceMeters = 0.0
        formattedAddress = ""
        id = ""
        placeId = ""
        address = nil
        geometry = nil
        icon = ""
        name = ""
        rating = 0.0
        url = URL(string: "")
        totalRating = 0
        types = []
        phoneNumber = ""
    }

    enum CodingKeys: String, CodingKey {

        case placeId = "place_id"
        case formattedAddress = "formatted_address"
        case address = "structured_formatting"
        case distanceMeters = "distance_meters"
        case totalRating = "user_ratings_total"
        case phoneNumber = "formatted_phone_number"

        case description
        case id
        case geometry
        case icon
        case name
        case url
        case rating
        case types
    }
}
