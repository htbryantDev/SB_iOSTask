//
//  TextFields.swift
//  SBTask
//
//  Created by Harry Bryant on 28/08/2021.
//  Copyright © 2021 The Beans Group. All rights reserved.
//

import SwiftUI

extension DesignSystem.Elements.TextFields {
    static func standard(
        placeholder: String,
        text: Binding<String>,
        isFocused: Bool,
        onEditingChanged: @escaping (Bool) -> Void
    ) -> some View {
        TextField(
            placeholder,
            text: text,
            onEditingChanged: onEditingChanged
        )
        .cornerRadius(DesignSystem.Foundation.cornerRadius)
        .textFieldStyle(DesignSystem.Styles.TextFields.standard())
        .overlay(FocusBorder(isFocused))
    }
    
    static func secure(
        placeholder: String,
        text: Binding<String>,
        isFocused: Bool,
        onCommit: @escaping () -> Void,
        onTap: @escaping () -> Void
        ) -> some View {
        SecureField(
            placeholder,
            text: text,
            onCommit: onCommit
        )
        .cornerRadius(DesignSystem.Foundation.cornerRadius)
        .textFieldStyle(DesignSystem.Styles.TextFields.standard())
        .overlay(FocusBorder(isFocused))
    }
}
