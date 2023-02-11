//  BackgroundViewController.swift
//  NikitaRekaev on 10/02/2023.

import UIKit

final class BackgroundViewController: BaseViewController<BackgroundView> {
    
    // MARK: - Properties
    
    var content: UIViewController?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let sheet = content?.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.prefersScrollingExpandsWhenScrolledToEdge = false
            sheet.prefersGrabberVisible = true
            sheet.largestUndimmedDetentIdentifier = .medium
            sheet.preferredCornerRadius = 20
            sheet.prefersEdgeAttachedInCompactHeight = true
            present(content ?? self, animated: true)
        }
        
    }
    
}
