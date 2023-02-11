//  Configurator.swift
//  Nikita Rekaev 11.02.2023

import UIKit

final class Configurator {
    
    func configureScene() -> UIViewController {
        
        let backgroundController = BackgroundViewController()
        let contentViewController = ContentViewController()
        
        backgroundController.content = contentViewController
        
        return backgroundController
    }
}
