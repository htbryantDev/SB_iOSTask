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
    
    override func fetch() -> AnyPublisher<[Photo], Never> {
        guard let data = data else {
            return Result.success([])
                .publisher
                .eraseToAnyPublisher()
        }
        
        let photos = try! JSONDecoder().decode([Photo].self, from: data)
        return Just(photos).eraseToAnyPublisher()
    }
}
