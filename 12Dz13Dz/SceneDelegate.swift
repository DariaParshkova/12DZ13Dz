//
//  SceneDelegate.swift
//  12Dz13Dz
//
//  Created by Parshkova Daria on 27.02.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            let textVc = TextViewController()
            let settingsVc = SettingsViewController()
            
            //MARK: Navigation
            let firstNavigation = UINavigationController(rootViewController: textVc)
            textVc.title = "text"
            let secondNavigation = UINavigationController(rootViewController: settingsVc)
            settingsVc.title = "settings"
            
            
            let tabBarVC = UITabBarController()
            tabBarVC.setViewControllers([firstNavigation,secondNavigation ], animated: true)
            textVc.tabBarItem.image = UIImage(systemName: "heart.circle")
            settingsVc.tabBarItem.image = UIImage(systemName: "gear.circle")
            
         
            window = UIWindow(frame: UIScreen.main.bounds)
            window?.windowScene = windowScene
            window?.rootViewController = tabBarVC
            window?.backgroundColor = .white
            window?.makeKeyAndVisible()
            
        }
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

extension TextViewController {
    func hideKeyBoardWithTapped() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
