//
//  LoginView.swift
//  SBTask
//
//  Created by Harry Bryant on 24/08/2021.
//  Copyright © 2021 The Beans Group. All rights reserved.
//

import SwiftUI

struct FocusBorder: View {
    private var isFocused = false
    
    init(_ isFocused: Bool) {
        self.isFocused = isFocused
    }
    
    var body: some View {
        RoundedRectangle(cornerRadius: .SBCornerRadius())
            .stroke(isFocused ? Color.SBPrimaryBlue() : Color.clear, lineWidth: 1)
            .foregroundColor(.clear)
    }
}

struct LoginView: View {
    private let viewModel: LoginViewModel
    
    @State private var emailTextField = ""
    @State private var passwordTextField = ""
    @State private var emailTextFieldFocused = false
    @State private var passwordTextFieldFocused = false
    @State private var buttonTapped = false
    @State private var loginButtonDisabled = true
    @State private var isActive = false
    
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
    }
        
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 24) {
                
                VStack(alignment: .leading, spacing: 8) {
                    Text.SBTitle("Welcome back")
                    Text.SBSubtitle("Log in to your Student Beans account")
                }
                
                VStack(spacing: 16) {
                    TextField(
                        "Email",
                        text: $emailTextField,
                        onEditingChanged: { isEditing in
                            emailTextFieldFocused = isEditing
                            passwordTextFieldFocused = !isEditing
                        }
                    )
                    .textFieldStyle(SBTextFieldStyle())
                    .overlay(FocusBorder(emailTextFieldFocused))
                    
                    VStack(alignment: .leading) {
                        SecureField(
                            "Password",
                            text: $passwordTextField,
                            onCommit: { passwordTextFieldFocused = false }
                        )
                        .textFieldStyle(SBTextFieldStyle())
                        .onTapGesture {
                            passwordTextFieldFocused = true
                        }
                        .overlay(FocusBorder(passwordTextFieldFocused))
                        
                        if !viewModel.isValidPassword(passwordTextField) {
                            Text("Your password must be at least 8 characters")
                                .foregroundColor(.red)
                                .font(.caption)
                        }
                    }
                    
                }
                
                Spacer()
                
                NavigationLink(
                    destination: PhotosView(),
                    isActive: $isActive,
                    label: {
                        Text("Log in")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(viewModel.isValidCredentials(emailTextField, passwordTextField) ? Color.SBPrimaryBlue(): Color.SBLightGray())
                            .foregroundColor(Color.white)
                            .cornerRadius(.SBCornerRadius())
                            
                    })
                    .disabled(!viewModel.isValidCredentials(emailTextField, passwordTextField))
                    
            
            }.padding(.all, 24)
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        return LoginView(viewModel: .init())
    }
}
#endif

