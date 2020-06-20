//
//  HomeDataManagerTests.swift
//  DogBreedsTests
//
//  Created by Abin Tom on 20/6/20.
//  Copyright © 2020 Tensorloop. All rights reserved.
//

import XCTest
@testable import DogBreeds

final class HomeDataManagerTests: XCTestCase {

    func testDogBreedsResponseParsing() {
        let dataManager = HomeDataManager()
        let dogBreedResponse = DogBreedResponse(name: "American Bully", lifeSpan: "8 – 15 years")
        let response = DogBreedGroupResponse(id: "1234", url: "https://www.example.com", breeds: [dogBreedResponse])
        let dogBreeds = dataManager.parseDogBreedResponse([response])
        XCTAssertEqual(dogBreeds.first?.name, "American Bully")
        XCTAssertEqual(dogBreeds.first?.imageURL, "https://www.example.com")
        XCTAssertEqual(dogBreeds.first?.lifeSpan, "8 – 15 years")
    }

    func testEmptyDogBreedsResponseParsing() {
        let dataManager = HomeDataManager()
        let response = DogBreedGroupResponse(id: "1234", url: "https://www.example.com", breeds: [])
        let dogBreeds = dataManager.parseDogBreedResponse([response])
        XCTAssertTrue(dogBreeds.isEmpty)
    }

}
