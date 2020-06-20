//
//  UITableView+Extensions.swift
//  DogBreeds
//
//  Created by Abin Tom on 21/6/20.
//  Copyright © 2020 Tensorloop. All rights reserved.
//

import UIKit

extension UITableView {
    func dequeue<T: UITableViewCell>(_: T.Type, for indexPath: IndexPath) -> T {
        let className = String(describing: T.self)
        guard let cell = dequeueReusableCell(withIdentifier: className, for: indexPath) as? T else {
            fatalError("Dequeue \(className) failed.")
        }
        return cell
    }
}
