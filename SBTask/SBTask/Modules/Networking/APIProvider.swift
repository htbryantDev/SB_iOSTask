//
//  APIProvider.swift
//  SBTask
//
//  Created by Harry Bryant on 30/08/2021.
//  Copyright © 2021 The Beans Group. All rights reserved.
//

import Combine
import Foundation

protocol APIProvider {
    typealias APIResponse = URLSession.DataTaskPublisher.Output
    func apiResponse(for request: URLRequest) -> AnyPublisher<APIResponse, URLError>
}
