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
            return .screenHeight / 2
        }
        
        let middleId = UISheetPresentationController.Detent.Identifier("middle")
        let middleDetent = UISheetPresentationController.Detent.custom(identifier: middleId) { _ in
            return .screenHeight / 1.34
        }
        
        let largeId = UISheetPresentationController.Detent.Identifier("big")
        let largeDetent = UISheetPresentationController.Detent.custom(identifier: largeId) { _ in
            return .screenHeight
        }
        
        content?.isModalInPresentation = true
        
        if let sheet = content?.sheetPresentationController {
            sheet.detents = [smallDetent, middleDetent, largeDetent]
            sheet.preferredCornerRadius = 20
            sheet.largestUndimmedDetentIdentifier = largeId
            
            present(content ?? self, animated: true)
        }
    }
    
}
