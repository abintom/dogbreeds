//
//  HomeRouter.swift
//  DogBreeds
//
//  Created by Abin Tom on 20/6/20.
//  Copyright © 2020 Tensorloop. All rights reserved.
//

import Foundation

private enum Constants {
    enum Keys {
        static let limit = "limit"
    }

    enum Values {
        static let limit = 50
    }
}

enum HomeRouter {
    case fetchDogBreed
}

extension HomeRouter: APIRouter {
    var method: HTTPMethod {
        switch self {
        case .fetchDogBreed:
            return .get
        }
    }

    var path: String {
        switch self {
        case .fetchDogBreed:
            return "images/search"
        }
    }

    var parameters: [String : Any]? {
        switch self {
        case .fetchDogBreed:
            return [Constants.Keys.limit: Constants.Values.limit]
        }
    }
}
