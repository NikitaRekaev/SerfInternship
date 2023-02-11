//  BottomView.swift
//  Nikita Rekaev 11.02.2023

import UIKit

final class BottomView: UIView {
    
    // MARK: - Properties
    
    private let offerLabel: UILabel = BottomView.makeLabel(text: Localizable.Label.offer)
    private let offerButton: UIButton = BottomView.makeButton()
    
    // MARK: - Life cycle
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setViewAppearance()
        setViewPosition()
    }
    
}

// MARK: - Create subviews

private extension BottomView {
    
    static func makeLabel(text: String = "Label") -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = Fonts.SFProDisplay.regular.font(size: 14)
        label.textColor = .lightGray
        label.sizeToFit()
        return label
    }
    
    static func makeButton() -> UIButton {
        let button = UIButton()
        button.backgroundColor = .black
        button.layer.cornerRadius = .screenHeight / 11 / 2
        button.setTitle(Localizable.Button.send, for: .normal)
        button.tintColor = .white
        return button
    }
}

// MARK: - Private methods

private extension BottomView {
    
    func setViewAppearance() {
        backgroundColor = .systemBackground
    }
    
    func setViewPosition() {
        [offerLabel, offerButton].forEach { addView($0) }
        
        NSLayoutConstraint.activate([
            offerButton.topAnchor.constraint(equalTo: topAnchor),
            offerButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            offerButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.58),
            offerButton.heightAnchor.constraint(equalToConstant: .screenHeight / 11),
            
            offerLabel.centerYAnchor.constraint(equalTo: offerButton.centerYAnchor),
            offerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        ])
    }
    
}
