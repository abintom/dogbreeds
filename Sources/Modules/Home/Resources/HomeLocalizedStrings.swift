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
    static let noItems = HomeLocalizedString.string("no-items")
    static let fetchDataError = HomeLocalizedString.string("fetch-data-error")
    static let loading = HomeLocalizedString.string("loading")
    static let lifespanPrefix = HomeLocalizedString.string("lifespan-prefix")
    static let sortLifespanTitle = HomeLocalizedString.string("sort-lifespan-title")
    static let sortAscending = HomeLocalizedString.string("sort-ascending")
    static let sortDescending = HomeLocalizedString.string("sort-descending")
}

private extension HomeLocalizedString {
    static func string(_ key: String, _ args: CVarArg...) -> String {
        .localizableString("Home", key, args)
    }
}
