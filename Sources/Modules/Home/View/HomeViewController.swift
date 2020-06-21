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
    @IBOutlet private var sortSegmentContainer: UIView!
    @IBOutlet private var sortTitleLabel: UILabel!
    @IBOutlet private var sortSegmentControl: UISegmentedControl!

    // MARK: - Properties

    private var viewModel = HomeViewModel()

    // MARK: - Lifecycle methods.

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupObservers()
        viewModel.loadData()
    }

    // MARK: - Actions

    @IBAction func sortValueDidChange(_ sender: UISegmentedControl) {
        viewModel.didSelectSegment(sender.selectedSegmentIndex)
    }

    // MARK: - Private methods

    private func setupViews() {
        navigationItem.title = viewModel.title
        sortTitleLabel.text = viewModel.sortTitle
        viewModel.sortSegments.enumerated().forEach { index, title in
            self.sortSegmentControl.setTitle(title, forSegmentAt: index)
        }
    }

    private func setupObservers() {
        viewModel.stateChangeObserver = { [weak self] state in
            self?.updateViews()
        }
    }

    private func updateViews() {
        tableView.reloadData()
        sortSegmentControl.selectedSegmentIndex = viewModel.selectedSegment
        sortSegmentContainer.isHidden = viewModel.isSortSegmentHidden
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
