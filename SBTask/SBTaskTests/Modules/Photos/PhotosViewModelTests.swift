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
    var state: PhotosViewModel.State!
    
    override func setUp() {
        cancellables = []
        state = nil
    }
    
    func testWhenInitialisedThenDefaultStateShouldBeLoading() throws {
        let viewModel = makeSubject(data: nil)
        XCTAssertEqual(viewModel.state, .loading)
    }
        
    func testWhenFetchPhotosWithSuccessResponseThenShouldSetPhotosWithResult() throws {
        let viewModel = makeSubject(data: MockData().photos)
        let expected = try! JSONDecoder().decode([Photo].self, from: MockData().photos)
        let expectation = self.expectation(description: "Awaiting publisher")
        
        viewModel.fetchPhotos()
        
        subscribeAndFulfill(viewModel: viewModel, expectation: expectation)
        
        waitForExpectations(timeout: 5)
        XCTAssertEqual(state, .loaded(photos: expected))
    }
    
    func testWhenFetchPhotosWithFailureResponseThenSetStateError() throws {
        let viewModel = makeSubject(data: nil)
        let expectation = self.expectation(description: "Awaiting publisher")
        
        viewModel.fetchPhotos()
        
        subscribeAndFulfill(viewModel: viewModel, expectation: expectation)
        
        waitForExpectations(timeout: 5)
        XCTAssertEqual(viewModel.state, .error)
    }
    
    private func subscribeAndFulfill(viewModel: PhotosViewModel, expectation: XCTestExpectation) {
        viewModel.$state.dropFirst().sink { [weak self] value in
            self?.state = value
            expectation.fulfill()
        }
        .store(in: &cancellables)
    }
    
    private func makeSubject(data: Data?) -> PhotosViewModel {
        let requestService = MockPhotosRequestService(data: data)
        return .init(requestService: requestService)
    }
}
