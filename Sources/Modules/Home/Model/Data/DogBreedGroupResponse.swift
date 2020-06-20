//
//  DogBreedGroupResponse.swift
//  DogBreeds
//
//  Created by Abin Tom on 20/6/20.
//  Copyright © 2020 Tensorloop. All rights reserved.
//

import Foundation

struct DogBreedGroupResponse: Decodable {
    let id: String
    let url: String
    let breeds: [DogBreedResponse]
}
