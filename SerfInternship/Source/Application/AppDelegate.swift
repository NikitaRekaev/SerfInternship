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
        
        if #available(iOS 13.0, *) {
            window?.overrideUserInterfaceStyle = .light
        }
        
        setRootScreen()
        return true
    }
    
}

// MARK: - Private methods

private extension AppDelegate {
    
    func setRootScreen() {
        let configurator = Configurator()
        let navigationController = UINavigationController(rootViewController: configurator.configureScene())
        
        window?.rootViewController = navigationController
    }
    
}
