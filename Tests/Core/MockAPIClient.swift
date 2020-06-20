//
//  MockAPIClient.swift
//  DogBreeds
//
//  Created by Abin Tom on 20/6/20.
//  Copyright © 2020 Tensorloop. All rights reserved.
//

import Foundation
@testable import DogBreeds

final class MockAPIClient: APIClient {
    private let mockPath: String?

    init(mockPath: String?) {
        self.mockPath = mockPath
    }

    override func performRequest<T: Decodable>(route: APIRouter,
                                               completion: @escaping (Result<T, NetworkError>) -> Void) -> URLSessionDataTask? {
        guard let path = mockPath else {
            completion(.failure(NetworkError.general(message: "Mock file not found")))
            return nil
        }
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: path)),
            let dataModel = try? jsonDecoder.decode(T.self, from: data) else {
                completion(.failure(NetworkError.jsonDecodingFailed))
                return nil
        }
        completion(.success(dataModel))
        return nil
    }
}
