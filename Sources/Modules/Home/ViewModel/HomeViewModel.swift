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

    var stateChangeObserver: ((State) -> Void)?

    private let apiClient: HomeAPIClient
    private(set) var state: State = .loading {
        didSet {
            stateChangeObserver?(state)
        }
    }

    init(_ apiClient: HomeAPIClient = .init()) {
        self.apiClient = apiClient
    }

    // MARK: - Internal methods

    func loadData() {
        state = .loading
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

    func numberOfRows(in section: Int = 0) -> Int {
        switch state {
        case .loading, .info:
            return 1
        case let .success(dogBreeds):
            return dogBreeds.count
        }
    }

    func cellModel(for indexPath: IndexPath) -> HomeCellViewModel? {
        guard case let .success(dogBreeds) = state else { return nil }
        return HomeCellViewModel(dogBreed: dogBreeds[indexPath.row])
    }
}
