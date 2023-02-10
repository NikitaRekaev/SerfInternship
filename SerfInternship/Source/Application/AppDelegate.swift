//  AppDelegate.swift
//  Nikita Rekaev 10.02.2023

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        setRootScreen()
        return true
    }
    
}

// MARK: - Private Methods

private extension AppDelegate {
    
    func setRootScreen() {
        let rootViewController = ViewController()
        window?.rootViewController = UINavigationController(rootViewController: rootViewController)
    }
    
}
