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
        ScrollView {
            LazyVStack(spacing: 8) {
                ForEach(viewModel.photos, id: \.self) {
                    DesignSystem.Patterns.PhotoRows.standard(photo: $0)
                }
            }
        }
        .padding(.horizontal, 16)
        .navigationTitle("Photos")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
            leading: Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "chevron.backward")
                    .foregroundColor(.black)
            })
        .onAppear {
            viewModel.fetchPhotos()
        }
    }
}

struct PhotosView_Previews: PreviewProvider {
    static var previews: some View {
        return PhotosView(viewModel: PhotosViewModel())
    }
}
