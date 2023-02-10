//  MainModuleConfigurator.swift
//  NikitaRekaev on 10/02/2023.

import UIKit

final class MainModuleConfigurator {

    // MARK: - Internal methods

    func configure(output: MainModuleOutput? = nil) -> MainViewController {
        let view = MainViewController()
        let presenter = MainPresenter()
        let router = MainRouter()

        presenter.view = view
        presenter.router = router
        presenter.output = output
        router.view = view
        view.output = presenter

        return view
    }

}
