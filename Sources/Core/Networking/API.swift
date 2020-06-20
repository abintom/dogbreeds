//
//  API.swift
//  DogBreeds
//
//  Created by Abin Tom on 20/6/20.
//  Copyright © 2020 Tensorloop. All rights reserved.
//

import Foundation

enum API {
    static let basePath = "https://api.thedogapi.com/v1"

    enum HTTPHeaderField: String {
        case contentType = "Content-Type"
    }

    enum ContentType: String {
        case json = "application/json"
    }
}

enum HTTPMethod: String {
    case get = "GET"
}

enum NetworkError: Error {
    case invalidURL
    case jsonDecodingFailed
    case general(message: String)
}
