//
//  SceneDelegate.swift
//  SBTask
//
//  Created by Harry Bryant on 24/08/2021.
//  Copyright © 2021 The Beans Group. All rights reserved.
//

import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  var window: UIWindow?
  
  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    let contentView = LoginView(viewModel: .init())
    
    // Use a UIHostingController as window root view controller
    if let windowScene = scene as? UIWindowScene {
      let window = UIWindow(windowScene: windowScene)
      window.rootViewController = UIHostingController(rootView: contentView)
      self.window = window
      window.makeKeyAndVisible()
    }
  }
}
