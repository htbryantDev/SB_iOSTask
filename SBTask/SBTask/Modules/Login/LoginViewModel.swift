//
//  LoginViewModel.swift
//  SBTask
//
//  Created by Harry Bryant on 27/08/2021.
//  Copyright © 2021 The Beans Group. All rights reserved.
//

import Foundation

struct LoginViewModel {
    private let validator: Validator
    
    init(validator: Validator = .init()) {
        self.validator = validator
    }
    
    func isValidCredentials(_ email: String, _ password: String) -> Bool {
        validator.loginCredentials(email, password)
    }
    
    func isValidPassword(_ password: String) -> Bool {
        validator.password(password)
    }
}
