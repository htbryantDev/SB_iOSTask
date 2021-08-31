//
//  PhotosViewModel.swift
//  SBTask
//
//  Created by Harry Bryant on 27/08/2021.
//  Copyright © 2021 The Beans Group. All rights reserved.
//

import Foundation
import Combine

class PhotosViewModel: ObservableObject {
    enum State: Equatable {
        case loading
        case error
        case loaded(photos: [Photo])
    }
    
    @Published private(set) var state: State = .loading
    private let requestService: PhotosRequestService
    private var cancellables = Set<AnyCancellable>()
    
    init(requestService: PhotosRequestService = .init()) {
        self.requestService = requestService
    }
    
    func fetchPhotos() {
        requestService.fetch()
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] completion in
                    switch completion {
                    case .finished:
                        break
                    case .failure:
                        self?.state = .error
                    }
                }, receiveValue: { [weak self] in
                    self?.state = .loaded(photos: $0)
                })
            .store(in: &cancellables)
    }
    
    deinit {
        cancellables.forEach { $0.cancel() }
    }
}
