//
//  HomeViewController.swift
//  DogBreeds
//
//  Created by Abin Tom on 20/6/20.
//  Copyright © 2020 Tensorloop. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {

    // MARK: - Properties

    private var viewModel = HomeViewModel()

    // MARK: - Lifecycle methods.

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }

    // MARK: - Private methods

    private func setupViews() {
        navigationItem.title = viewModel.title
    }
}
