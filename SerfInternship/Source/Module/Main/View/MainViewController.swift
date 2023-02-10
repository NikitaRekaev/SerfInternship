//  MainViewController.swift
//  NikitaRekaev on 10/02/2023.

import UIKit

final class MainViewController: UIViewController, MainViewInput {

    // MARK: - Properties

    var output: MainViewOutput?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }

    // MARK: - MainViewInput

}
