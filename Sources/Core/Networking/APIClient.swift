//
//  APIClient.swift
//  DogBreeds
//
//  Created by Abin Tom on 20/6/20.
//  Copyright © 2020 Tensorloop. All rights reserved.
//

import Foundation

class APIClient {

    // MARK: - Properties

    let session: URLSession

    var jsonDecoder: JSONDecoder {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        return jsonDecoder
    }

    // MARK: - Initialisers

    init(session: URLSession = .shared) {
        self.session = session
    }

    // MARK: - Internal methods

    @discardableResult
    func performRequest<T: Decodable>(route: APIRouter,
                                      completion: @escaping (Result<T, NetworkError>) -> Void) -> URLSessionDataTask? {
        guard let request = try? route.urlRequest() else {
            completion(.failure(NetworkError.invalidURL))
            return nil
        }

        let dataTask = session.dataTask(with: request) { (data, _, error) in
            if let error = error  {
                DispatchQueue.main.async {
                    completion(.failure(NetworkError.general(message: error.localizedDescription)))
                }
                return
            }

            guard let data = data,
                let model = try? self.jsonDecoder.decode(T.self, from: data) else {
                    DispatchQueue.main.async {
                        completion(.failure(NetworkError.jsonDecodingFailed))
                    }
                    return
            }

            DispatchQueue.main.async {
                completion(.success(model))
            }
        }

        dataTask.resume()
        return dataTask
    }

}
