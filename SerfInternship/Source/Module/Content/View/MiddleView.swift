//  MiddleView.swift
//  Nikita Rekaev 11.02.2023

import UIKit

final class MiddleView: UIView {
    
    // MARK: - Properties
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        backgroundColor = .green
        setViewPosition()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Create subviews

private extension MiddleView {
    
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

private extension MiddleView {
    
    func setViewPosition() {
        
    }
}
