//
//  ImageLoader.swift
//  SBTask
//
//  Created by Harry Bryant on 27/08/2021.
//  Copyright © 2021 The Beans Group. All rights reserved.
//

import Combine
import Foundation
import SwiftUI

class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    private let url: URL
    private var cancellable: AnyCancellable?

    init(url: URL) {
        self.url = url
    }

    deinit {
        cancel()
    }
    
    func load() {
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
               .map { UIImage(data: $0.data) }
               .replaceError(with: nil)
               .receive(on: DispatchQueue.main)
               .sink { [weak self] in self?.image = $0 }
    }

    func cancel() {
        cancellable?.cancel()
    }
}
