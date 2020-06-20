//
//  HomeViewModel.swift
//  DogBreeds
//
//  Created by Abin Tom on 20/6/20.
//  Copyright © 2020 Tensorloop. All rights reserved.
//

import Foundation

final class HomeViewModel {
    enum State {
        case loading
        case info(message: String)
        case success(items: [DogBreed])
    }

    // MARK: - Properties

    let title = HomeLocalizedString.title

    private let apiClient: HomeAPIClient
    private(set) var state: State = .loading

    init(_ apiClient: HomeAPIClient = .init()) {
        self.apiClient = apiClient
    }

    // MARK: - Internal methods

    func loadData() {
        apiClient.fetchDogBreeds { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(response):
                let items = response
                if items.isEmpty {
                    self.state = .info(message: HomeLocalizedString.noItems)
                } else {
                    self.state = .success(items: items)
                }
            case .failure:
                self.state = .info(message: HomeLocalizedString.fetchDataError)
            }
        }
    }
}
