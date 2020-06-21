//
//  HomeCellViewModel.swift
//  DogBreeds
//
//  Created by Abin Tom on 20/6/20.
//  Copyright © 2020 Tensorloop. All rights reserved.
//

import UIKit

final class HomeCellViewModel {

    // MARK: - Properties
    
    private let dogBreed: DogBreed
    private let imageDownloader: ImageDownloader

    var imageURL: URL? {
        URL(string: dogBreed.imageURL)
    }

    var name: String {
        dogBreed.name
    }

    var lifespan: String {
        [HomeLocalizedString.lifespanPrefix,
         dogBreed.lifeSpan]
            .joined(separator: " ")
    }

    // MARK: - Init and deinit methods

    init(dogBreed: DogBreed,
         imageDownloader: ImageDownloader = .init()) {
        self.dogBreed = dogBreed
        self.imageDownloader = imageDownloader
    }

    deinit {
        imageDownloader.cancelImageDownload()
    }

    // MARK: - Internal methods

    func loadImage(_ completion: @escaping (UIImage?) -> Void) {
        guard let url = imageURL else { return }
        imageDownloader.loadImage(from: url) { image in
            completion(image)
        }
    }
}
