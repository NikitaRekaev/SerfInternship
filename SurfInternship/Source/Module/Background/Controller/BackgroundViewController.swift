//  BackgroundViewController.swift
//  NikitaRekaev on 10/02/2023.

import UIKit

final class BackgroundViewController: BaseViewController<BackgroundView> {

    // MARK: - Properties

    var content: UIViewController?

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presetSheet()
    }

}

// MARK: - Private methods

private extension BackgroundViewController {

    func presetSheet() {
        let smallId = UISheetPresentationController.Detent.Identifier("small")
        let smallDetent = UISheetPresentationController.Detent.custom(identifier: smallId) { _ in
            return OffSet.viewHeight * 2
        }

        let middleId = UISheetPresentationController.Detent.Identifier("middle")
        let middleDetent = UISheetPresentationController.Detent.custom(identifier: middleId) { _ in
            return OffSet.viewHeight * 3
        }

        content?.isModalInPresentation = true

        if let sheet = content?.sheetPresentationController {
            sheet.detents = [smallDetent, middleDetent, .large()]
            sheet.preferredCornerRadius = OffSet.padding
            sheet.largestUndimmedDetentIdentifier = .large

            present(content ?? self, animated: true)
        }
    }

}
