//
//  LoadingCell.swift
//  DogBreeds
//
//  Created by Abin Tom on 20/6/20.
//  Copyright © 2020 Tensorloop. All rights reserved.
//

import UIKit

final class LoadingCell: UITableViewCell {

    // MARK: - Outlets

    @IBOutlet private var loadingLabel: UILabel!
    @IBOutlet private var activityIndicator: UIActivityIndicatorView!

    // MARK: - Internal methods

    func configure(_ loadingText: String = HomeLocalizedString.loading) {
        loadingLabel.text = loadingText
        activityIndicator.startAnimating()
    }

}
