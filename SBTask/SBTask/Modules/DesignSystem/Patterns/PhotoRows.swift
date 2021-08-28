//
//  PhotoRows.swift
//  SBTask
//
//  Created by Harry Bryant on 30/08/2021.
//  Copyright © 2021 The Beans Group. All rights reserved.
//

import SwiftUI

extension DesignSystem.Patterns.PhotoRows {
    static func standard(photo: Photo) -> PhotoRow {
        .init(photo: photo)
    }
}

struct PhotoRow: View {
    private let photo: Photo
    
    init(photo: Photo) {
        self.photo = photo
    }
    
    var body: some View {
        HStack {
            if let photoURL = URL(string: photo.thumbnailUrl) {
                DesignSystem.Elements.Images.async(url: photoURL)
                    .frame(width: 100, height: 100)
                    .cornerRadius(DesignSystem.Foundation.cornerRadius)
            }
            
            DesignSystem.Elements.Texts.subtitle(photo.title)
                .padding(.leading, 8)
            Spacer()
            
        }
        .background(DesignSystem.Foundation.Colors.lightGray())
        .cornerRadius(DesignSystem.Foundation.cornerRadius)
    }
}
