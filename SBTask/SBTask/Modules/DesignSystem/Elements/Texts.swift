//
//  Text.swift
//  SBTask
//
//  Created by Harry Bryant on 27/08/2021.
//  Copyright © 2021 The Beans Group. All rights reserved.
//

import SwiftUI

extension DesignSystem.Elements.Texts {
    static func title(_ text: String) -> Text {
        Text(text)
            .font(.title2)
            .fontWeight(.bold)
    }
    
    static func subtitle(_ text: String) -> Text {
        Text(text)
            .font(.subheadline)
    }
    
    static func errorCaption(_ text: String) -> Text {
        caption(text, color: .red)
    }
    
    private static func caption(_ text: String, color: Color) -> Text {
        Text(text)
            .foregroundColor(color)
            .font(.caption)
    }
}
