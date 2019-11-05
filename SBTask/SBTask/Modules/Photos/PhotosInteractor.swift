//
//  PhotosInteractor.swift
//  SBTask
//
//  Created by Julien Claverie on 05/11/2019.
//  Copyright © 2019 The Beans Group. All rights reserved.
//
// Interactor: Responsible for retrieving data from the model layer, it is independent of the user interface.

import Foundation

class PhotosInteractor: PhotosInteractorInputProtocol {
    weak var presenter: PhotosInteractorOutputProtocol?
    
    func loadPhotos() {
        // Do network request here and call back the presenter on success.
    }
}
