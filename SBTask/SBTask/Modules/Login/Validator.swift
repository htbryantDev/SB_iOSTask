//
//  Validator.swift
//  SBTask
//
//  Created by Harry Bryant on 27/08/2021.
//  Copyright © 2021 The Beans Group. All rights reserved.
//

class Validator {
    func email(_ email: String) -> Bool {
        !email.isEmpty
    }
    
    func password(_ password: String) -> Bool {
        password.count >= 8
    }
    
    func loginCredentials(_ email: String, _ password: String) -> Bool {
        self.email(email) && self.password(password)
    }
}
