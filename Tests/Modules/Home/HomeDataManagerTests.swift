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
        XCTAssertEqual(dogBreeds.first?.lifespan, "8 – 15 years")
    }

    func testEmptyDogBreedsResponseParsing() {
        let dataManager = HomeDataManager()
        let response = DogBreedGroupResponse(id: "1234", url: "https://www.example.com", breeds: [])
        let dogBreeds = dataManager.parseDogBreedResponse([response])
        XCTAssertTrue(dogBreeds.isEmpty)
    }

    func testLifespanParsing() {
        let dataManager = HomeDataManager()
        XCTAssertEqual(dataManager.lifespan(from: "12 years"), 12)
        XCTAssertEqual(dataManager.lifespan(from: "12 - 16 years"), 14)
        XCTAssertEqual(dataManager.lifespan(from: "12- 16 years"), 14)
        XCTAssertEqual(dataManager.lifespan(from: "13-17 years"), 15)
        XCTAssertEqual(dataManager.lifespan(from: "12- 16 years"), 14)
        XCTAssertNil(dataManager.lifespan(from: "years"))
        XCTAssertNil(dataManager.lifespan(from: "12"))
        XCTAssertNil(dataManager.lifespan(from: "12 - 14"))
        XCTAssertEqual(dataManager.lifespan(from: "12 - 14 years 22 - 30 years"), 13)
        XCTAssertEqual(dataManager.lifespan(from: "13– 17 years 22 - 24 years"), 15)
        XCTAssertEqual(dataManager.lifespan(from: "17 years 22 - 24 years"), 17)
        XCTAssertEqual(dataManager.lifespan(from: "13years"), 13)
        XCTAssertEqual(dataManager.lifespan(from: "1year"), 1)
    }

    func testSorting() {
        let dataManager = HomeDataManager()
        let dogBreeds = [
            DogBreed(name: "Breed 1", imageURL: "https://www.example.com", lifespan: "12 - 14 years", averageLifespan: 13),
            DogBreed(name: "Breed 2", imageURL: "https://www.example.com", lifespan: "7 - 8 years", averageLifespan: 7.5),
            DogBreed(name: "Breed 3", imageURL: "https://www.example.com", lifespan: "14 - 18 years", averageLifespan: 16)
        ]
        XCTAssertEqual(dataManager.sortedByLifespan(dogBreeds).first?.name, "Breed 2")
        XCTAssertEqual(dataManager.sortedByLifespan(dogBreeds, isAsending: false).first?.name, "Breed 3")
    }
}
