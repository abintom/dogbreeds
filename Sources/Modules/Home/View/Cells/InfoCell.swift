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
    @IBOutlet private var primaryButton: UIButton!

    // MARK: - Properties

    private var primaryButtonAction: (() -> Void)?

    // MARK: - Actions

    @IBAction private func primaryButtonClicked(_ sender: UIButton) {
        primaryButtonAction?()
    }

    // MARK: - Internal methods

    func configure(_ message: String,
                   primaryButtonAction: (() -> Void)? = nil) {
        infoLabel.text = message
        self.primaryButtonAction = primaryButtonAction
        primaryButton.isHidden = primaryButtonAction == nil
    }

}
