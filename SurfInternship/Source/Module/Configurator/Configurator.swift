//  Configurator.swift
//  Nikita Rekaev 11.02.2023

import UIKit

final class Configurator {

    func configureScene() -> UIViewController {

        let backgroundController = BackgroundViewController()
        let contentViewController = ContentViewController()
        let topCollectionConfigurator = TopCollectionConfigurator()
        let middleCollectionConfigurator = MiddleCollectionConfigurator()

        contentViewController.topCollectionDataSource = topCollectionConfigurator
        contentViewController.topCollectionDelegate = topCollectionConfigurator
        contentViewController.middleCollectionDataSource = middleCollectionConfigurator
        contentViewController.middleCollectionDelegate = middleCollectionConfigurator

        backgroundController.content = contentViewController

        return backgroundController
    }
}
