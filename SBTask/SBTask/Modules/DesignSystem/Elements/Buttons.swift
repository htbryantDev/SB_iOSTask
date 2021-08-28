//
//  Buttons.swift
//  SBTask
//
//  Created by Harry Bryant on 28/08/2021.
//  Copyright © 2021 The Beans Group. All rights reserved.
//

import SwiftUI

extension DesignSystem.Elements.Buttons {
    typealias Colors = DesignSystem.Foundation.Colors
    
    static func primaryNavigationLink<T: View>(
        title: String,
        destination: T,
        isDestinationActive: Binding<Bool>,
        isEnabled: Bool
    ) -> some View {
        NavigationLink(
            destination: destination,
            isActive: isDestinationActive,
            label: {
                Text(title)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(isEnabled ? Colors.primaryBlue() : Colors.lightGray())
                    .foregroundColor(Color.white)
                    .cornerRadius(DesignSystem.Foundation.cornerRadius)
            })
            .disabled(!isEnabled)
    }
}
