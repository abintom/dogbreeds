//
//  ImageDownloader.swift
//  DogBreeds
//
//  Created by Abin Tom on 21/6/20.
//  Copyright © 2020 Tensorloop. All rights reserved.
//

import UIKit
import Nuke

final class ImageDownloader {

    // MARK: - Properties

    private var task: ImageTask?
    private let imagePipeline: ImagePipeline = .shared

    // MARK: - Internal methods

    func loadImage(from url: URL, _ completion: @escaping (UIImage?) -> Void) {
        task = imagePipeline.loadImage(with: url) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(response):
                completion(response.image)
            case .failure:
                completion(nil)
            }
            self.task = nil
        }
    }

    func cancelImageDownload() {
        task?.cancel()
        task = nil
    }
}
