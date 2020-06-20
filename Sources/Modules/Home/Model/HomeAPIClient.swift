//
//  HomeAPIClient.swift
//  DogBreeds
//
//  Created by Abin Tom on 20/6/20.
//  Copyright © 2020 Tensorloop. All rights reserved.
//

import Foundation

struct HomeAPIClient {

    private let apiClient: APIClient

    init(apiClient: APIClient = .init()) {
        self.apiClient = apiClient
    }

    func fetchDogBreeds(completion: @escaping (Result<[DogBreed], NetworkError>) -> Void) {
        // Cancelling previous photo fetching task to avoid delayed call back of previous search query.
        let route = HomeRouter.fetchDogBreed
        apiClient.performRequest(route: route) {
            completion($0.map(HomeDataManager().parseDogBreedResponse))
        }
    }
}
