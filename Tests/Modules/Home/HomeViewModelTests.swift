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
}
