//
//  HomeCell.swift
//  DogBreeds
//
//  Created by Abin Tom on 20/6/20.
//  Copyright © 2020 Tensorloop. All rights reserved.
//

import UIKit

final class HomeCell: UITableViewCell {

    // MARK: - Outlets

    @IBOutlet private var photoImageView: UIImageView!
    @IBOutlet private var photoContainerView: UIView!
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var lifespanLabel: UILabel!

    // MARK: - Life cycle

    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }

    // MARK: - Private methods

    private func setupView() {
        photoImageView.layer.cornerRadius = 4.0
        photoContainerView.layer.cornerRadius = 4.0
        photoContainerView.layer.shadowColor = UIColor.systemGray.cgColor
        photoContainerView.layer.shadowOffset = .init(width: 0, height: 0.5)
        photoContainerView.layer.shadowOpacity = 0.5
        photoContainerView.layer.shadowRadius = 3.0
        photoContainerView.layer.masksToBounds = false
    }

    // MARK: - Internal methods

    func configure(_ viewModel: HomeCellViewModel?) {
        nameLabel.text = viewModel?.name
        lifespanLabel.text = viewModel?.lifespan
    }
}
