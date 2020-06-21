//
//  HomeCell.swift
//  DogBreeds
//
//  Created by Abin Tom on 20/6/20.
//  Copyright © 2020 Tensorloop. All rights reserved.
//

import Nuke
import UIKit

final class HomeCell: UITableViewCell {

    // MARK: - Outlets

    @IBOutlet private var photoImageView: UIImageView!
    @IBOutlet private var photoContainerView: UIView!
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var lifespanLabel: UILabel!

    // MARK: - Properties

    private var viewModel: HomeCellViewModel?

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
        self.viewModel = viewModel
        nameLabel.text = viewModel?.name
        lifespanLabel.text = viewModel?.lifespan
        photoImageView.image = nil
        viewModel?.loadImage { [weak self] image in
            guard let self = self else { return }
            self.photoImageView.image = image
        }
    }
}
