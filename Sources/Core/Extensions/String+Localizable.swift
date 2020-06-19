//
//  String+Localizable.swift
//  DogBreeds
//
//  Created by Abin Tom on 20/6/20.
//  Copyright © 2020 Tensorloop. All rights reserved.
//

import Foundation

extension String {
    static func localizableString(_ table: String, _ key: String, _ args: CVarArg...) -> String {
        let format = NSLocalizedString(key,
                                       tableName: table,
                                       bundle: Bundle(for: BundleClass.self),
                                       comment: "")
        return String(format: format,
                      locale: Locale.current,
                      arguments: args)
    }
}

private final class BundleClass {}
