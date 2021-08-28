//
//  URLSession+APIProvider.swift
//  SBTask
//
//  Created by Harry Bryant on 30/08/2021.
//  Copyright © 2021 The Beans Group. All rights reserved.
//

import Foundation
import Combine

extension URLSession: APIProvider {
    func apiResponse(for request: URLRequest) -> AnyPublisher<APIResponse, URLError> {
        return dataTaskPublisher(for: request).eraseToAnyPublisher()
    }
}
