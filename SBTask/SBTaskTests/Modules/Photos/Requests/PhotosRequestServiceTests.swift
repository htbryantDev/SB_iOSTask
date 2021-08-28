//
//  PhotosRequestServiceTests.swift
//  SBTaskTests
//
//  Created by Harry Bryant on 28/08/2021.
//  Copyright © 2021 The Beans Group. All rights reserved.
//

@testable import SBTask
import Combine
import XCTest

class PhotosRequestServiceTests: XCTestCase {
    private var cancellables: Set<AnyCancellable>!
    
    override func setUp() {
        cancellables = []
    }
    
    func restFetchWhenResponseIsErrorThenReturnEmptyArray() throws {
        let apiProvider = MockAPIProvider(data: nil, error: .badServerResponse)
        let service = PhotosRequestService(apiProvider: apiProvider)
        var photos = [Photo]()
        
        service.fetch()
            .sink { results in
                photos = results
            }
            .store(in: &cancellables)
        
        XCTAssertEqual(photos, [])
    }
    
    func testFetchWhenResponseIsSuccessThenReturnPhotos() throws {
        let expected = try! JSONDecoder().decode([Photo].self, from: MockData().photos)
        
        let apiProvider = MockAPIProvider(data: MockData().photos, error: nil)
        let service = PhotosRequestService(apiProvider: apiProvider)
        var photos = [Photo]()
        
        service.fetch()
            .sink { results in
                photos = results
            }
            .store(in: &cancellables)
        
        XCTAssertEqual(photos, expected)
    }
}
