//
//  ParameterEncoder.swift
//  CallingApp
//
//  Created by Islam on 2/7/20.
//  Copyright © 2020 App Lineup. All rights reserved.
//

import Foundation

public enum NetworkError: String, Error {
    case parametersNIL = "parameters were nil."
    case encodingFailed = "parameters encoding failed."
    case missingURL = "URL is nil."
}

protocol ParametersEncoder {
    static func encode(request: inout URLRequest, parameters: Parameters) throws
}
