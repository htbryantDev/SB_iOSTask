//
//  Images.swift
//  SBTask
//
//  Created by Harry Bryant on 30/08/2021.
//  Copyright © 2021 The Beans Group. All rights reserved.
//

import SwiftUI

extension DesignSystem.Elements.Images {
    static func async(url: URL) -> AsyncImage {
        AsyncImage(url: url)
    }
}

struct AsyncImage: View {
    @StateObject private var loader: ImageLoader
    private let placeholder = Text("...")

    fileprivate init(url: URL) {
        _loader = StateObject(wrappedValue: ImageLoader(url: url))
    }

    var body: some View {
        content
            .onAppear(perform: loader.load)
    }

    private var content: some View {
        Group {
            if loader.image != nil {
                Image(uiImage: loader.image!)
                    .resizable()
            } else {
                placeholder
            }
        }
    }
}
