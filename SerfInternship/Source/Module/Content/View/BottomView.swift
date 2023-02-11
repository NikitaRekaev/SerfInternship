//  BottomView.swift
//  Nikita Rekaev 11.02.2023

import UIKit

final class BottomView: UIView {
    
    // MARK: - Properties
    
    private let offerLabel: UILabel = BottomView.makeLabel()
    private let button: UIButton = BottomView.makeButton()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        backgroundColor = .red
        setViewPosition()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Create subviews

private extension BottomView {
    
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

private extension BottomView {
    
    func setViewPosition() {
        
    }
}
