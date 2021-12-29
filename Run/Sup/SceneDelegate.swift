//
//  SceneDelegate.swift
//  Run
//
//  Created by George Vilnei Arboite Gomes on 04/03/21.
//  Copyright © 2021 George Gomes. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        let window = UIWindow(windowScene: windowScene)
        window.frame = UIScreen.main.bounds
        
        let viewController = MainViewController()
        
        window.rootViewController = viewController
        window.makeKeyAndVisible()
        
        self.window = window
    }

}

