//
//  LoginViewModelTests.swift
//  SBTaskTests
//
//  Created by Harry Bryant on 27/08/2021.
//  Copyright © 2021 The Beans Group. All rights reserved.
//

@testable import SBTask
import XCTest

class LoginViewModelTests: XCTestCase {
    func testIsValidCredentialsShouldReturnFalseWhenValidatorReturnsFalse() throws {
        let viewModel = LoginViewModel(validator: MockValidator(injectedResult: false))
        XCTAssertFalse(viewModel.isValidCredentials("", ""))
    }
    
    func testIsValidCredentialsShouldReturnTrueWhenValidatorReturnsTrue() throws {
        let viewModel = LoginViewModel(validator: MockValidator(injectedResult: true))
        XCTAssertTrue(viewModel.isValidCredentials("", ""))
    }
}
