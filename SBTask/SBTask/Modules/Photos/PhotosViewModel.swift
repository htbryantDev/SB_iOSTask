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
    @Published private(set)var photos = [Photo]()
    private let requestService: PhotosRequestService
    
    init(requestService: PhotosRequestService = .init()) {
        self.requestService = requestService
    }
    
    func fetchPhotos() {
        requestService.fetch()
            .receive(on: DispatchQueue.main)
            .assign(to: &$photos)
    }
}
