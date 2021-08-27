//
//  SBPrimaryButtonStyle.swift
//  SBTask
//
//  Created by Harry Bryant on 27/08/2021.
//  Copyright © 2021 The Beans Group. All rights reserved.
//

import SwiftUI

struct SBPrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.SBPrimaryBlue())
            .foregroundColor(Color.white)
            .cornerRadius(.SBCornerRadius())
    }
}
