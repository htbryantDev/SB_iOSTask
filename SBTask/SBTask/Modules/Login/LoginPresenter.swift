//
//  LoginPresenter.swift
//  SBTask
//
//  Created by Julien Claverie on 05/11/2019.
//  Copyright © 2019 The Beans Group. All rights reserved.
//
// Presenter: Contains view logic for preparing content for display (as received from the Interactor) and for reacting
// to user inputs (by requesting new data from the Interactor).

import Foundation

class LoginPresenter: LoginPresenterProtocol {
    weak private var view: LoginViewProtocol?
    var interactor: LoginInteractorInputProtocol?
    private let router: LoginRouterProtocol

    init(interface: LoginViewProtocol, interactor: LoginInteractorInputProtocol?, router: LoginRouterProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad() {
        
    }
    
    func didPressLoginButton() {
        router.navigateToPhotos()
    }
}

extension LoginPresenter: LoginInteractorOutputProtocol {
}
