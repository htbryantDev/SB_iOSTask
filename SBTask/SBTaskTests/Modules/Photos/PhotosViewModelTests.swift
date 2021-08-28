//
//  PhotosViewModel.swift
//  SBTaskTests
//
//  Created by Harry Bryant on 28/08/2021.
//  Copyright © 2021 The Beans Group. All rights reserved.
//

@testable import SBTask
import XCTest
import Combine

class PhotosViewModelTests: XCTestCase {
    var cancellables: Set<AnyCancellable>!
    var photos: [Photo] = [Photo]()
    
    override func setUp() {
        cancellables = []
        photos = []
    }
    
    func testWhenInitialisedThenPhotosShouldBeEmpty() throws {
        let viewModel = makeSubject(data: nil)
        XCTAssertEqual(viewModel.photos, [])
    }
        
    func testWhenFetchPhotosWithSuccessResponseThenShouldSetPhotosWithResult() throws {
        let viewModel = makeSubject(data: MockData().photos)
        let expected = try! JSONDecoder().decode([Photo].self, from: MockData().photos)
        let expectation = self.expectation(description: "Awaiting publisher")
        
        viewModel.fetchPhotos()
        
        subscribeAndFulfill(viewModel: viewModel, expectation: expectation)
                        
        waitForExpectations(timeout: 5)
        XCTAssertEqual(photos, expected)
    }
    
    func testWhenFetchPhotosWithFailureResponseThenPhotosShouldBeEmpty() throws {
        let viewModel = makeSubject(data: nil)
        let expectation = self.expectation(description: "Awaiting publisher")
        
        viewModel.fetchPhotos()
        
        subscribeAndFulfill(viewModel: viewModel, expectation: expectation)
        
        waitForExpectations(timeout: 5)
        XCTAssertEqual(photos, [])
    }
    
    private func subscribeAndFulfill(viewModel: PhotosViewModel, expectation: XCTestExpectation) {
        viewModel.$photos.dropFirst().sink { [weak self] value in
            self?.photos = value
            expectation.fulfill()
        }
        .store(in: &cancellables)
    }
    
    private func makeSubject(data: Data?) -> PhotosViewModel {
        let requestService = MockPhotosRequestService(data: data)
        return .init(requestService: requestService)
    }
}
