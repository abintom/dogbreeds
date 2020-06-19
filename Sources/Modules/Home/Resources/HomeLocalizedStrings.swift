//
//  HomeLocalizedStrings.swift
//  DogBreeds
//
//  Created by Abin Tom on 20/6/20.
//  Copyright © 2020 Tensorloop. All rights reserved.
//

import Foundation

enum HomeLocalizedString {
    static let title = HomeLocalizedString.string("title")
}

private extension HomeLocalizedString {
    static func string(_ key: String, _ args: CVarArg...) -> String {
        .localizableString("Home", key, args)
    }
}
