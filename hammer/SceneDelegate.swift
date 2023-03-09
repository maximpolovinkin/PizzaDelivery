//
//  SceneDelegate.swift
//  hammer
//
//  Created by Максим Половинкин on 13.10.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        
        let tabBar = UITabBarController()
        tabBar.tabBar.backgroundColor = .white
        tabBar.tabBar.unselectedItemTintColor = #colorLiteral(red: 0.7638193965, green: 0.7687924504, blue: 0.7902012467, alpha: 1)
        tabBar.tabBar.selectedImageTintColor = #colorLiteral(red: 0.9875084758, green: 0.2303813398, blue: 0.41417557, alpha: 1)
        
        let assemblyBuilder = ModuleBuilder()
        let router = Router(tabBar: tabBar, assemblyBuilder: assemblyBuilder)
    
        router.initialVC()
        tabBar.viewControllers?[1].loadViewIfNeeded()
        tabBar.viewControllers?[2].loadViewIfNeeded()
        tabBar.viewControllers?[3].loadViewIfNeeded()

        window?.rootViewController = tabBar
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
        
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

