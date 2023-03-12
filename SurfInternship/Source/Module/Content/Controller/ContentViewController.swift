//  ContentViewController.swift
//  Nikita Rekaev 11.02.2023

import UIKit

final class ContentViewController: BaseViewController<ContentRootView> {

    // MARK: - Properties

    var topCollectionDelegate: UICollectionViewDelegate?
    var topCollectionDataSource: UICollectionViewDataSource?

    var middleCollectionDelegate: UICollectionViewDelegate?
    var middleCollectionDataSource: UICollectionViewDataSource?

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        selfView.setCallback(callback: showAlert)
        selfView.setInfiniteCollectionDelegate(dataSource: topCollectionDataSource,
                                               delegate: topCollectionDelegate)
        selfView.setAnimatedCollectionDelegate(dataSource: middleCollectionDataSource,
                                               delegate: middleCollectionDelegate)
    }

}

// MARK: - Private methods

private extension ContentViewController {

    func showAlert() {
        let alert = UIAlertController(title: Localizable.Alert.title,
                                      message: Localizable.Alert.message,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: Localizable.Alert.action, style: .default))

        self.present(alert, animated: true, completion: nil)
    }

}
