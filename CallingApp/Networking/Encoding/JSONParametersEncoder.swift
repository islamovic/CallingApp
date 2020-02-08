//
//  JSONParametersEncoder.swift
//  CallingApp
//
//  Created by Islam on 2/7/20.
//  Copyright © 2020 App Lineup. All rights reserved.
//

import Foundation

class JSONParametersEncoder: ParametersEncoder {

    static func encode(request: inout URLRequest, parameters: Parameters) throws {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: parameters, options: .fragmentsAllowed)
            request.httpBody = jsonData
            if request.value(forHTTPHeaderField: "Content-Type") == nil {
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            }
        } catch {
            throw NetworkError.encodingFailed
        }
    }
}
