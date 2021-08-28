//
//  LoginViewModel.swift
//  SBTask
//
//  Created by Harry Bryant on 27/08/2021.
//  Copyright © 2021 The Beans Group. All rights reserved.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var emailTextField = "" {
        didSet {
            loginButtonEnabled = isValidCredentials
        }
    }
    @Published var loginButtonEnabled = false
    @Published var passwordTextField = "" {
        didSet {
            loginButtonEnabled = isValidCredentials
        }
    }
    @Published var isActive = false
    @Published var isEmailFocused = false
    @Published var isPasswordFocused = false {
        didSet {
            if isPasswordFocused {
                passwordDidEdit = true
            }
        }
    }
    
    private let validator: Validator
    private var passwordDidEdit = false
    
    var isValidCredentials: Bool {
        validator.loginCredentials(emailTextField, passwordTextField)
    }
    
    var isValidPassword: Bool {
        validator.password(passwordTextField)
    }
    
    var shouldShowPasswordError: Bool {
        passwordDidEdit && !isValidPassword
    }
    
    init(validator: Validator = .init()) {
        self.validator = validator
    }
}
