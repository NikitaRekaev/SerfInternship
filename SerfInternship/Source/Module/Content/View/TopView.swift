//  TopView.swift
//  Nikita Rekaev 11.02.2023

import UIKit

final class TopView: UIView {
    
    // MARK: - Properties
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        backgroundColor = .yellow
        setViewPosition()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Create subviews

private extension TopView {
    
    static func makeLabel() -> UILabel {
        let label = UILabel()
        return label
    }
    
    static func makeButton() -> UIButton {
        let button = UIButton()
        return button
    }
}

// MARK: - Private methods

private extension TopView {
    
    func setViewPosition() {
        
    }
}
