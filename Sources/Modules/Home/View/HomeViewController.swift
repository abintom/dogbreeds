//
//  HomeViewController.swift
//  DogBreeds
//
//  Created by Abin Tom on 20/6/20.
//  Copyright © 2020 Tensorloop. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet private var tableView: UITableView!

    // MARK: - Properties

    private var viewModel = HomeViewModel()

    // MARK: - Lifecycle methods.

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupObservers()
        viewModel.loadData()
    }

    // MARK: - Private methods

    private func setupViews() {
        navigationItem.title = viewModel.title
    }

    private func setupObservers() {
        viewModel.stateChangeObserver = { [weak self] state in
            self?.tableView.reloadData()
        }
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows(in: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch viewModel.state {
        case .loading:
            let cell = tableView.dequeue(LoadingCell.self, for: indexPath)
            cell.configure()
            return cell
        case let .info(message):
            let cell = tableView.dequeue(InfoCell.self, for: indexPath)
            cell.configure(message)
            return cell
        case .success:
            let cell = tableView.dequeue(HomeCell.self, for: indexPath)
            cell.configure(viewModel.cellModel(for: indexPath))
            return cell
        }
    }
}
