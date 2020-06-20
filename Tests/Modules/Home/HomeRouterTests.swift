//
//  HomeRouterTests.swift
//  DogBreedsTests
//
//  Created by Abin Tom on 20/6/20.
//  Copyright © 2020 Tensorloop. All rights reserved.
//

import XCTest
@testable import DogBreeds

final class HomeRouterTests: XCTestCase {

    func testHomeRouterValues() {
        let router = HomeRouter.fetchDogBreed
        guard let urlRequest = try? router.urlRequest() else {
            XCTFail("URL Request not constructed properly for Home Router serachPhoto api")
            return
        }

        XCTAssertEqual(urlRequest.url?.absoluteString, "https://api.thedogapi.com/v1/images/search?limit=50")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }
}
