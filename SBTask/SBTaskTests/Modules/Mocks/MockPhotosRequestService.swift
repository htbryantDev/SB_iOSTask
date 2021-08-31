//
//  MockPhotosRequestService.swift
//  SBTaskTests
//
//  Created by Harry Bryant on 30/08/2021.
//  Copyright © 2021 The Beans Group. All rights reserved.
//

@testable import SBTask
import Combine
import Foundation

class MockPhotosRequestService: PhotosRequestService {
    private let data: Data?
    
    init(data: Data?) {
        self.data = data
    }
    
    override func fetch() -> AnyPublisher<[Photo], Error> {
        guard let data = data else {
            return Result.failure(NSError(domain: "", code: 0, userInfo: nil))
                .publisher
                .eraseToAnyPublisher()
        }
        
        let photos = try! JSONDecoder().decode([Photo].self, from: data)
        return Just(photos)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
