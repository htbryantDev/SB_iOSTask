//
//  LoginView.swift
//  SBTask
//
//  Created by Harry Bryant on 24/08/2021.
//  Copyright © 2021 The Beans Group. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject private var viewModel: LoginViewModel
    private typealias Colors = DesignSystem.Foundation.Colors
    private typealias Elements = DesignSystem.Elements
    
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 32) {
                VStack(alignment: .leading, spacing: 8) {
                    Elements.Texts.title("Welcome back")
                        .padding(.top, 50)
                        .navigationBarHidden(true)
                    Elements.Texts.subtitle("Log in to your Student Beans account")
                }
                
                VStack(spacing: 16) {
                    Elements.TextFields.standard(
                        placeholder: "Email",
                        text: $viewModel.emailTextField,
                        isFocused: viewModel.isEmailFocused,
                        onEditingChanged: { isEditing in
                            viewModel.isEmailFocused = isEditing
                            viewModel.isPasswordFocused = !isEditing
                        }
                    )
                    
                    VStack(alignment: .leading) {
                        Elements.TextFields.secure(
                            placeholder: "Password",
                            text: $viewModel.passwordTextField,
                            isFocused: viewModel.isPasswordFocused,
                            onCommit: { viewModel.isPasswordFocused = false },
                            onTap: { viewModel.isPasswordFocused = true }
                        )
                        
                        if viewModel.shouldShowPasswordError {
                            Elements.Texts.errorCaption("Your password must be at least 8 characters")
                        }
                    }
                }
                
                Spacer()
                
                Elements.Buttons.primaryNavigationLink(
                    title: "Log in",
                    destination: PhotosView(viewModel: .init()),
                    isDestinationActive: $viewModel.isActive,
                    isEnabled: viewModel.isValidCredentials
                )
                                
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

