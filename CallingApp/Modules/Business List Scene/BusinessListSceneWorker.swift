//
//  BusinessListSceneWorker.swift
//  CallingApp
//
//  Created by Islam on 2/9/20.
//  Copyright © 2020 App Lineup. All rights reserved.
//

import Foundation

class BusinessListSceneWorker {

    func fetchBusiness(input: String, _ completionHandler: @escaping([Business], CustomError?) -> Void) {
        
        let path = "autocomplete/json"
        let parameters = ["input": input, "key": "AIzaSyCeVX5m3lIf60kbPtV_nIpNlZU4sNvwIGE"]
        let autocompleteEndPoint = EndPoint(path: path, parameters: parameters, method: .get)

        Router.shared.request(autocompleteEndPoint, success: { (data, response) in
            do {
                let decoder = JSONDecoder()
                let businessList = try decoder.decode(BusineessList.self, from: data)
                completionHandler(businessList.businesses, nil)
            } catch let error {
                completionHandler([], CustomError.custom(error.localizedDescription))
            }
        }) { (error) in
            completionHandler([], CustomError.custom("Could not load business"))
        }
    }
}
