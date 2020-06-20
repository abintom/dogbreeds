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
                                lifeSpan: "8 – 15 years")
        let cellModel = HomeCellViewModel(dogBreed: dogBreed)
        XCTAssertEqual(cellModel.name, "American Bully")
        XCTAssertEqual(cellModel.imageURL, "https://www.example.com")
        XCTAssertEqual(cellModel.lifespan, "Lifespan: 8 – 15 years")
    }

}
