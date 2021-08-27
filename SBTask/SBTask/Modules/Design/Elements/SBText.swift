//
//  Text.swift
//  SBTask
//
//  Created by Harry Bryant on 27/08/2021.
//  Copyright © 2021 The Beans Group. All rights reserved.
//

import SwiftUI

extension Text {
    static func SBTitle(_ text: String) -> Self {
        Text(text)
            .font(.title2)
            .fontWeight(.bold)
    }
    
    static func SBSubtitle(_ text: String) -> Self {
        Text(text)
            .font(.subheadline)
    }
}
