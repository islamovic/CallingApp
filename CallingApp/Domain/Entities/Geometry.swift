//
//  Geometry.swift
//  CallingApp
//
//  Created by Islam on 2/9/20.
//  Copyright © 2020 App Lineup. All rights reserved.
//

import Foundation

struct Geometry: Decodable {
    let location: Point
    let northeastViewPort: Point
    let southwestViewPort: Point
}

struct Point: Decodable {
    let latitude: Double
    let longitude: Double

    enum CodingKeys: String, CodingKey {
        case latitude = "lat"
        case longitude = "lng"
    }
}
