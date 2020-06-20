//
//  HomeCellViewModel.swift
//  DogBreeds
//
//  Created by Abin Tom on 20/6/20.
//  Copyright © 2020 Tensorloop. All rights reserved.
//

import Foundation

struct HomeCellViewModel {

    // MARK: - Properties
    
    let dogBreed: DogBreed

    var imageURL: String {
        dogBreed.imageURL
    }

    var name: String {
        dogBreed.name
    }

    var lifespan: String {
        [HomeLocalizedString.lifespanPrefix,
         dogBreed.lifeSpan]
            .joined(separator: " ")
    }
}
