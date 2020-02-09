//
//  BusinessInfoSceneWorker.swift
//  CallingApp
//
//  Created by Islam on 2/9/20.
//  Copyright © 2020 App Lineup. All rights reserved.
//

import Foundation

class BusinessInfoSceneWorker {

    func fetchBusiness(placeId: String, _ completionHandler: @escaping(Business?, CustomError?) -> Void) {

        let path = "details/json"
        let parameters = ["place_id": placeId,
                          "key": "AIzaSyCeVX5m3lIf60kbPtV_nIpNlZU4sNvwIGE",
                          "fields": "name,rating,formatted_address,url,rating,user_ratings_total,geometry,icon,name,formatted_phone_number,type"]
        let autocompleteEndPoint = EndPoint(path: path, parameters: parameters, method: .get)

        Router.shared.request(autocompleteEndPoint, success: { (data, response) in
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(BusinessResult.self, from: data)
                completionHandler(result.business, nil)
            } catch let error {
                completionHandler(nil, CustomError.custom(error.localizedDescription))
            }
        }) { (error) in
            completionHandler(nil, CustomError.custom("Could not load business"))
        }
    }
}
