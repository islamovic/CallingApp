//
//  CallingAppTests.swift
//  CallingAppTests
//
//  Created by Islam on 2/11/20.
//  Copyright © 2020 App Lineup. All rights reserved.
//

import XCTest
@testable import CallingApp

class CallingAppTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchRent() {
        let presentSpy = PresentSpy()
        let interactor = BusinessListSceneInteractor(presenter: presentSpy)
        interactor.worker = Worker()

        interactor.fetchBusinessList(input: "Rent")
        interactor.fetchBusinesses(input: "Rent")

        let response = presentSpy.fetchedBusinessListResponse?.value ?? []
        XCTAssertEqual(response.count, 3)
    }

    func testFetchRenatlType() {
        let presentSpy = PresentSpy()
        let interactor = BusinessListSceneInteractor(presenter: presentSpy)
        interactor.worker = Worker()

        interactor.fetchBusinessList(input: "Rent")
        interactor.fetchBusinesses(input: "Rent")

        let response = presentSpy.fetchedBusinessListResponse?.value ?? []

        var rentalType: [Business] = []
        response.forEach {
            let rents = $0.types.filter { $0 == "car_rental" }
            if !rents.isEmpty {
                rentalType.append($0)
            }
        }

        XCTAssertEqual(rentalType.count, 3)
    }
}

extension CallingAppTests {

    class PresentSpy: BusinessListScenePresentingLogic {
        var fetchedBusinessListResponse: BusinessListScene.Fetch.Response?

        func presentFetchedBusiness(_ response: BusinessListScene.Fetch.Response) {
            fetchedBusinessListResponse = response
        }
    }

    class Worker: BusinessListSceneWorker {

        override func fetchBusiness(input: String, _ completionHandler: @escaping ([Business], CustomError?) -> Void) {
            let businessList = [
                Business(name: "cairoRental"          , type: ["car_rental", "establishment"], placeId: "ChIJAcTuKJuQ3w8Rl38ROfnzGGo"),
                Business(name: "AlexRent"             , type: ["car_rental", "establishment"], placeId: "ChIJAcTuKJuQ3w8Ro"),
                Business(name: "Ezzat Car"            , type: ["car_rental", "place"]        , placeId: "w8Rl38ROfnzGGo"),
                Business(name: "Kempineski, Cairo"    , type: ["lodging", "geo_location"]    , placeId: "ChIJAcTuKJuQ3w8Rl38ROfn"),
                Business(name: "Kempineski, France"   , type: ["lodging"]                    , placeId: "ChIJROf"),
                Business(name: "Cairo Stadium"        , type: ["place"]                      , placeId: "ChIJAcTnzGGo"),
                Business(name: "Camp Nou"             , type: ["place"]                      , placeId: "ChIJAcTuKJuQ3w8Rl38ROfnzGGo"),
                Business(name: "Manchester car Rentel", type: ["car_rental"]                 , placeId: "ChIJAcTuKJuQROfnzGGo"),
                Business(name: "place9"               , type: ["lodging"]                    , placeId: "ChIJAcT3w8Rl38ROfnzGGo"),
                Business(name: "place10"              , type: ["lodging"]                    , placeId: "ChIJAcTuKJuQ3w8Rl38ROfnzGGoChIJAcTuKJuQ3w8Rl38ROfnzGGo")]
            completionHandler(businessList, nil)
        }
    }
}
