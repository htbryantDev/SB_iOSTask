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
    func testLoginButtonEnabledShouldReturnFalseByDefault() throws {
        let viewModel = LoginViewModel(validator: MockValidator(injectedResult: false))
        XCTAssertFalse(viewModel.loginButtonEnabled)
    }
    
    func testIsValidCredentialsShouldReturnFalseWhenValidatorReturnsFalse() throws {
        let viewModel = LoginViewModel(validator: MockValidator(injectedResult: false))
        XCTAssertFalse(viewModel.isValidCredentials)
    }
    
    func testIsValidCredentialsShouldReturnTrueWhenValidatorReturnsTrue() throws {
        let viewModel = LoginViewModel(validator: MockValidator(injectedResult: true))
        XCTAssertTrue(viewModel.isValidCredentials)
    }
    
    func testShouldShowPasswordErrorWhenPasswordTextFieldHasNotBeenFocusedYetReturnsFalse() throws {
        let viewModel = LoginViewModel(validator: MockValidator(injectedResult: false))
        XCTAssertFalse(viewModel.shouldShowPasswordError)
    }
    
    func testShouldShowPasswordErrorWhenPasswordTextFieldHasBeenFocusedAndInputIsValidReturnsFalse() throws {
        let viewModel = LoginViewModel(validator: MockValidator(injectedResult: true))
        viewModel.isPasswordFocused = true
        XCTAssertFalse(viewModel.shouldShowPasswordError)
    }
    
    func testShouldShowPasswordWhenPasswordTextFieldHasBeenFocusedAndInputIsInvalidReturnsTrue() throws {
        let viewModel = LoginViewModel(validator: MockValidator(injectedResult: false))
        viewModel.isPasswordFocused = true
        XCTAssertTrue(viewModel.shouldShowPasswordError)
    }
    
    func testWhenEmailTextFieldIsChangedAndIsValidCredentialsThenLoginButtonEnabledShouldReturnTrue() throws {
        let viewModel = LoginViewModel(validator: MockValidator(injectedResult: true))
        viewModel.emailTextField = "harry.bryant@studentbeans.co.uk"
        XCTAssertTrue(viewModel.loginButtonEnabled)
    }
    
    func testWhenEmailTextFieldIsChangedAndIsInvalidCredentialsThenLoginButtonEnabledShouldReturnFalse() throws {
        let viewModel = LoginViewModel(validator: MockValidator(injectedResult: false))
        viewModel.emailTextField = "harry.bryant@studentbeans.co.uk"
        XCTAssertFalse(viewModel.loginButtonEnabled)
    }
    
    func testWhenPasswordTextFieldIsChangedAndIsValidCredentialsThenLoginButtonEnabledShouldReturnTrue() throws {
        let viewModel = LoginViewModel(validator: MockValidator(injectedResult: true))
        viewModel.passwordTextField = "12345"
        XCTAssertTrue(viewModel.loginButtonEnabled)
    }
    
    func testWhenPasswordTextFieldIsChangedAndIsInvalidCredentialsThenLoginButtonEnabledShouldReturnFalse() throws {
        let viewModel = LoginViewModel(validator: MockValidator(injectedResult: false))
        viewModel.passwordTextField = "12345"
        XCTAssertFalse(viewModel.loginButtonEnabled)
    }
}
