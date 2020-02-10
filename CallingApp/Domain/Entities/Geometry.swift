//
//  Geometry.swift
//  CallingApp
//
//  Created by Islam on 2/9/20.
//  Copyright © 2020 App Lineup. All rights reserved.
//

import Foundation

struct ViewPort: Decodable {
    let northeastViewPort: Point
    let southwestViewPort: Point

    enum CodingKeys: String, CodingKey {
        case northeastViewPort = "northeast"
        case southwestViewPort = "southwest"
    }
}

struct Geometry: Decodable {
    let location: Point
    let viewport: ViewPort

    enum CodingKeys: String, CodingKey {
        case location
        case viewport = "viewport"
    }
}

struct Point: Decodable {
    let latitude: Double
    let longitude: Double

    enum CodingKeys: String, CodingKey {
        case latitude = "lat"
        case longitude = "lng"
    }
}
