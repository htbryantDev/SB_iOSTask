//
//  PhotosPresenter.swift
//  SBTask
//
//  Created by Julien Claverie on 05/11/2019.
//  Copyright © 2019 The Beans Group. All rights reserved.
//
// Presenter: Contains view logic for preparing content for display (as received from the Interactor) and for reacting
// to user inputs (by requesting new data from the Interactor).

import Foundation

class PhotosPresenter: PhotosPresenterProtocol {
    weak private var view: PhotosViewProtocol?
    var interactor: PhotosInteractorInputProtocol?
    private let router: PhotosRouterProtocol

    init(interface: PhotosViewProtocol, interactor: PhotosInteractorInputProtocol?, router: PhotosRouterProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
}

extension PhotosPresenter: PhotosInteractorOutputProtocol {
    func didFinishLoadingPhotos(_ photos: [Photo]) {
        // Tell the view to reload.
    }
}
