//
//  APIRouter.swift
//  DogBreeds
//
//  Created by Abin Tom on 20/6/20.
//  Copyright © 2020 Tensorloop. All rights reserved.
//

import Foundation

protocol APIRouter {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: [String: Any]? { get }
}

extension APIRouter {

    func urlRequest() throws -> URLRequest {
        guard let url = URL(string: API.basePath)?.appendingPathComponent(path) else {
            throw NetworkError.invalidURL
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.setValue(API.ContentType.json.rawValue, forHTTPHeaderField: API.HTTPHeaderField.contentType.rawValue)

        switch method {
        case .get:
            guard var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false),
                let parameters = parameters else {
                    return urlRequest
            }

            let queryParameters = queryItems(parameters)
            urlComponents.queryItems = queryParameters
            urlRequest.url = urlComponents.url
        }
        return urlRequest
    }

    private func queryItems(_ parameters: [String: Any]) -> [URLQueryItem] {
        return parameters
            .keys
            .sorted(by: <)
            .compactMap { key in
                parameters[key].map { URLQueryItem(name: key, value: String(describing: $0)) }
        }
    }

}
