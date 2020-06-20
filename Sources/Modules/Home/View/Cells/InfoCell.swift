//
//  InfoCell.swift
//  DogBreeds
//
//  Created by Abin Tom on 20/6/20.
//  Copyright © 2020 Tensorloop. All rights reserved.
//

import UIKit

final class InfoCell: UITableViewCell {

    // MARK: - Outlets

    @IBOutlet private var infoLabel: UILabel!

    // MARK: - Internal methods

    func configure(_ message: String) {
        infoLabel.text = message
    }

}
