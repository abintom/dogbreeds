//
//  Stub.swift
//  DogBreeds
//
//  Created by Abin Tom on 20/6/20.
//  Copyright © 2020 Tensorloop. All rights reserved.
//

import Foundation

enum Stub: String {
    case fetchDogBreeds = "fetch-dog-breeds"
    case fetchEmptyDogBreeds = "fetch-dog-breeds-empty"
    case empty = "empty"

    var path: String? {
        Bundle(for: MockAPIClient.self)
            .path(forResource: rawValue,
                  ofType: "json")
    }
}
