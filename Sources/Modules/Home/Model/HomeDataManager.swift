//
//  HomeDataManager.swift
//  DogBreeds
//
//  Created by Abin Tom on 20/6/20.
//  Copyright © 2020 Tensorloop. All rights reserved.
//

import Foundation

struct HomeDataManager {
    func parseDogBreedResponse(_ response: [DogBreedGroupResponse]) -> [DogBreed] {
        response.flatMap { group in
            group.breeds.map { breed in
                DogBreed(name: breed.name, imageURL: group.url, lifeSpan: breed.lifeSpan)
            }
        }
    }
}
