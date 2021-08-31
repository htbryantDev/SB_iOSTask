//
//  PhotosView.swift
//  SBTask
//
//  Created by Harry Bryant on 27/08/2021.
//  Copyright © 2021 The Beans Group. All rights reserved.
//

import SwiftUI
import Combine

struct PhotosView: View {
    @ObservedObject private var viewModel: PhotosViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    init(viewModel: PhotosViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        switch viewModel.state {
        case .loading:
            LoadingView()
                .modifier(makeNavigationBarModifier())
                .onAppear {
                    viewModel.fetchPhotos()
                }
            
        case let .loaded(photos):
            ScrollView {
                LazyVStack(spacing: 8) {
                    ForEach(photos, id: \.self) {
                        DesignSystem.Patterns.PhotoRows.standard(photo: $0)
                    }
                }
            }
            .modifier(makeNavigationBarModifier())
            
        case .error: ErrorView()
            .modifier(makeNavigationBarModifier())
        }
    }
}

extension PhotosView {
    private func makeNavigationBarModifier() -> DesignSystem.ViewModifiers.NavigationBarModifier {
        return .init(title: "Photos", backButtonAction: {
            self.presentationMode.wrappedValue.dismiss()
        })
    }
}

struct PhotosView_Previews: PreviewProvider {
    static var previews: some View {
        return PhotosView(viewModel: PhotosViewModel())
    }
}
