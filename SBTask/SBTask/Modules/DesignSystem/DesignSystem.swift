//
//  DesignSystem.swift
//  SBTask
//
//  Created by Harry Bryant on 28/08/2021.
//  Copyright © 2021 The Beans Group. All rights reserved.
//

import SwiftUI

struct DesignSystem {
    struct Elements {
        struct Texts {}
        struct TextFields {}
        struct Buttons {}
        struct Images {}
    }
    
    struct Patterns {
        struct PhotoRows {}
    }
    
    struct Styles {
        struct TextFields {
            struct standard: TextFieldStyle {
                func _body(configuration: TextField<Self._Label>) -> some View {
                       configuration
                        .padding()
                        .frame(height: 45)
                        .cornerRadius(DesignSystem.Foundation.cornerRadius)
                        .background(DesignSystem.Foundation.Colors.lightGray())
                   }
            }
        }
        
        struct Buttons {
            struct buttons: ButtonStyle {
                func makeBody(configuration: Configuration) -> some View {
                    configuration.label
                        .padding()
                        .background(DesignSystem.Foundation.Colors.primaryBlue())
                        .foregroundColor(Color.white)
                        .cornerRadius(DesignSystem.Foundation.cornerRadius)
                }
            }
        }
    }
    
    struct Foundation {
        static var cornerRadius: CGFloat = 4
        struct Colors {}
    }
}
