//
//  ValidatorTests.swift
//  SBTaskTests
//
//  Created by Harry Bryant on 27/08/2021.
//  Copyright © 2021 The Beans Group. All rights reserved.
//

@testable import SBTask
import XCTest

class ValidatorTests: XCTestCase {
    var validator: Validator!
    
    override func setUp() {
        validator = .init()
    }
    
    func testLoginCredentialsWithValidInputShouldReturnTrue() throws {
        XCTAssertTrue(validator.loginCredentials("harry.bryant@studentbeans.co.uk", "12345678"))
    }
    
    func testLoginCredentialsWithInvalidEmailAndValidPasswordShouldReturnFalse() throws {
        XCTAssertFalse(validator.loginCredentials("", "12345678"))
    }
    
    func testLoginCredentialsWithValidEmailAndInvalidPasswordShouldReturnFalse() throws {
        XCTAssertFalse(validator.loginCredentials("harry.bryant@studentbeans.co.uk", ""))
    }
}
