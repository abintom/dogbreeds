//
//  HomeDataManager.swift
//  DogBreeds
//
//  Created by Abin Tom on 20/6/20.
//  Copyright © 2020 Tensorloop. All rights reserved.
//

import Foundation

struct HomeDataManager {

    // MARK: - Private methods

    private func matches(for pattern: String, in text: String) -> [String] {
        let regex = try? NSRegularExpression(pattern: pattern, options: .caseInsensitive)
        let matches = regex?.matches(in: text, options: [], range: NSRange(location: 0, length: text.count)) ?? []
        return matches.compactMap { result in
            Range(result.range, in: text).flatMap { String(text[$0]) }
        }
    }

    func lifespan(from text: String) -> Double? {
        let lifespanPattern = #"(\d+)[\s-–\s\d]*year"#
        guard let string = matches(for: lifespanPattern, in: text).first else {
            return nil
        }

        let numericPattern = #"\d+"#
        let years = matches(for: numericPattern, in: string).compactMap(Double.init)
        guard !years.isEmpty else { return nil }
        return years.reduce(0.0, +)/Double(years.count)
    }

    // Returns sorted `DogBreed` model based on lifespan
    func parseDogBreedResponse(_ response: [DogBreedGroupResponse]) -> [DogBreed] {
        sort(
            response.flatMap { group in
                group.breeds.compactMap { breed in
                    self.lifespan(from: breed.lifeSpan).map {
                        DogBreed(name: breed.name,
                                 imageURL: group.url,
                                 lifespan: breed.lifeSpan,
                                 averageLifespan: $0)
                    }
                }
            }
        )
    }

    func sort(_ dogBreeds: [DogBreed], isAsending: Bool = true) -> [DogBreed] {
        dogBreeds.sorted {
            isAsending
                ? $0.averageLifespan < $1.averageLifespan
                : $0.averageLifespan >= $1.averageLifespan
        }
    }
}
