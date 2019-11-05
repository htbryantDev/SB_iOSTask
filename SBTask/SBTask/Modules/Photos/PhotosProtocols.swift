//
//  PhotosProtocols.swift
//  SBTask
//
//  Created by Julien Claverie on 05/11/2019.
//  Copyright © 2019 The Beans Group. All rights reserved.
//
// Protocols: Define interactions between components of the VIPER module.

import Foundation

// MARK: Router
/// Navigation
protocol PhotosRouterProtocol: AnyObject {
}

// MARK: - Presenter
/// ViewController -> Presenter
protocol PhotosPresenterProtocol: AnyObject {
    var interactor: PhotosInteractorInputProtocol? { get set }
}

// MARK: - Interactor
/// Presenter -> Interactor
protocol PhotosInteractorInputProtocol: AnyObject {
    var presenter: PhotosInteractorOutputProtocol? { get set }
    
    func loadPhotos()
}

/// Interactor -> Presenter
protocol PhotosInteractorOutputProtocol: AnyObject {
    func didFinishLoadingPhotos(_ photos: [Photo])
}

// MARK: - View
/// Presenter -> ViewController
protocol PhotosViewProtocol: AnyObject {
    var presenter: PhotosPresenterProtocol? { get set }
}
