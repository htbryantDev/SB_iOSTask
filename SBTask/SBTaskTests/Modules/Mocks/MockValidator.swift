//
//  MockValidator.swift
//  SBTaskTests
//
//  Created by Harry Bryant on 27/08/2021.
//  Copyright © 2021 The Beans Group. All rights reserved.
//

@testable import SBTask

class MockValidator: Validator {
    private let injectedResult: Bool
    
    init(injectedResult: Bool) {
        self.injectedResult = injectedResult
    }
    
    override func email(_ email: String) -> Bool { injectedResult }
    override func password(_ password: String) -> Bool { injectedResult }
    override func loginCredentials(_ email: String, _ password: String) -> Bool { injectedResult }
}
