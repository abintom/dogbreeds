//
//  HomeCellViewModelTests.swift
//  DogBreedsTests
//
//  Created by Abin Tom on 20/6/20.
//  Copyright © 2020 Tensorloop. All rights reserved.
//

import XCTest
@testable import DogBreeds

final class HomeCellViewModelTests: XCTestCase {

    func testValues() {
        let dogBreed = DogBreed(name: "American Bully",
                                imageURL: "https://www.example.com",
                                lifespan: "8 – 15 years",
                                averageLifespan: 11.5)
        let cellModel = HomeCellViewModel(dogBreed: dogBreed)
        XCTAssertEqual(cellModel.name, "American Bully")
        XCTAssertEqual(cellModel.imageURL?.absoluteString, "https://www.example.com")
        XCTAssertEqual(cellModel.lifespan, "Lifespan: 8 – 15 years")
    }

}
