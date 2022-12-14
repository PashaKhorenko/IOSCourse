//
//  SceneDelegate.swift
//  Shopping list
//
//  Created by Паша Хоренко on 04.01.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        
        let navigationController = UINavigationController(rootViewController: ViewController())
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        self.window = window
    }

}
