//
//  FocusBorder.swift
//  SBTask
//
//  Created by Harry Bryant on 28/08/2021.
//  Copyright © 2021 The Beans Group. All rights reserved.
//

import SwiftUI

struct FocusBorder: View {
    private var isFocused = false
    private typealias Colors = DesignSystem.Foundation.Colors
    
    init(_ isFocused: Bool) {
        self.isFocused = isFocused
    }
    
    var body: some View {
        RoundedRectangle(cornerRadius: DesignSystem.Foundation.cornerRadius)
            .stroke(isFocused ? Colors.primaryBlue() : Color.clear, lineWidth: 1)
            .foregroundColor(.clear)
    }
}
