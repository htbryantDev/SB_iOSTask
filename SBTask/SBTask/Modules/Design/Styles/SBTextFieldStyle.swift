//
//  SBTextFieldStyle.swift
//  SBTask
//
//  Created by Harry Bryant on 27/08/2021.
//  Copyright © 2021 The Beans Group. All rights reserved.
//

import SwiftUI

struct SBTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
           configuration
            .padding()
            .frame(height: 45)
            .cornerRadius(.SBCornerRadius())
            .background(Color.SBLightGray())
       }
}
