//
//  MockAPIProvider.swift
//  SBTaskTests
//
//  Created by Harry Bryant on 30/08/2021.
//  Copyright © 2021 The Beans Group. All rights reserved.
//

@testable import SBTask
import Combine
import Foundation

struct MockAPIProvider: APIProvider {
    private let error: URLError.Code?
    private let data: Data?
    
    init(data: Data?, error: URLError.Code?) {
        self.data = data
        self.error = error
    }
    
    func apiResponse(for request: URLRequest) -> AnyPublisher<APIResponse, URLError> {
        if let error = error {
            return Result.failure(.init(error))
                .publisher
                .eraseToAnyPublisher()
        } else {
            let response = HTTPURLResponse(url: request.url!, statusCode: 200, httpVersion: "HTTP/1.1", headerFields: nil)!
            return Result.success((data: data!, response: response))
                .publisher
                .eraseToAnyPublisher()
        }
    }
}
