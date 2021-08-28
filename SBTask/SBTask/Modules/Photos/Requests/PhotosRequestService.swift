//
//  RequestService.swift
//  SBTask
//
//  Created by Harry Bryant on 28/08/2021.
//  Copyright © 2021 The Beans Group. All rights reserved.
//

import Combine
import Foundation

class PhotosRequestService {
    private let url = URL(string: "https://jsonplaceholder.typicode.com/photos")!
    private let apiProvider: APIProvider
    
    init(apiProvider: APIProvider = URLSession.shared) {
        self.apiProvider = apiProvider
    }
    
    func fetch() -> AnyPublisher<[Photo], Never> {
        apiProvider.apiResponse(for: URLRequest(url: url))
            .map { $0.data }
            .decode(type: [Photo].self, decoder: JSONDecoder())
            .replaceError(with: [])
            .eraseToAnyPublisher()
    }
}
