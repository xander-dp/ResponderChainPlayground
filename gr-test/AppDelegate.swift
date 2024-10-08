//
//  AppDelegate.swift
//  gr-test
//
//  Created by Oleksandr Savchenko on 08.10.24.
//

import UIKit

class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }

    // MARK: UISceneSession Lifecycle
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        let configuration = UISceneConfiguration(name: "MyOrdinaryDefaultMainSceneConfiguration",
                                                 sessionRole: .windowApplication)
        configuration.sceneClass = UIWindowScene.self
        configuration.delegateClass = SceneDelegate.self

        return configuration;
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {}

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        print("Touches BEGAN on \(AppDelegate.self)")
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        print("Touches MOVED on \(AppDelegate.self)")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        print("Touches ENDED on \(AppDelegate.self)")
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        print("Touches CANCELED on \(AppDelegate.self)")
    }
}

