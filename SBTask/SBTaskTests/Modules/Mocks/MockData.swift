//
//  MockData.swift
//  SBTaskTests
//
//  Created by Harry Bryant on 30/08/2021.
//  Copyright © 2021 The Beans Group. All rights reserved.
//

import Foundation

class MockData {
    private var testBundle: Bundle {
        Bundle(for: type(of: self))
    }
    
    private func filePath(_ fileName: String, ofType: String = "json") -> URL {
        let path = testBundle.path(forResource: fileName, ofType: ofType)!
        return URL(fileURLWithPath: path)
    }
    
    var photos: Data {
        return try! Data(contentsOf: filePath("photos"))
    }
}
