//
//  HomeViewModelTests.swift
//  DogBreedsTests
//
//  Created by Abin Tom on 20/6/20.
//  Copyright © 2020 Tensorloop. All rights reserved.
//

import XCTest
@testable import DogBreeds

final class HomeViewModelTests: XCTestCase {
    func testStaticValues() {
        let viewModel = HomeViewModel()
        XCTAssertEqual(viewModel.title, "DogBreeds")
    }

    func testFetchDogBreedData() {
        let apiClient = MockAPIClient(mockPath: Stub.fetchDogBreeds.path)
        let viewModel = HomeViewModel(HomeAPIClient(apiClient: apiClient))
        viewModel.loadData()
        guard case let .success(models) = viewModel.state else {
            XCTFail("Dog breed response not parsed properly.")
            return
        }
        XCTAssertEqual(models.count, 32)
        XCTAssertEqual(models.first?.imageURL, "https://cdn2.thedogapi.com/images/SkFt1gc47_1280.jpg")
        XCTAssertEqual(models.first?.name, "American Bully")
        XCTAssertEqual(models.first?.lifeSpan, "8 – 15 years")
    }

    func testEmptyDogBreedData() {
        let apiClient = MockAPIClient(mockPath: Stub.fetchEmptyDogBreeds.path)
        let viewModel = HomeViewModel(HomeAPIClient(apiClient: apiClient))
        viewModel.loadData()
        guard case let .info(message) = viewModel.state else {
            XCTFail("Dog breed response not parsed properly.")
            return
        }
        XCTAssertEqual(message, "No results")
    }

    func testFetchDogBreedFailure() {
        let apiClient = MockAPIClient(mockPath: Stub.empty.path)
        let viewModel = HomeViewModel(HomeAPIClient(apiClient: apiClient))
        viewModel.loadData()
        guard case let .info(message) = viewModel.state else {
            XCTFail("Dog breed response not parsed properly.")
            return
        }
        XCTAssertEqual(message, "Fetching dog breeds failed. Please try again later.")
    }
}
