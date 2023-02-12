//  BottomView.swift
//  Nikita Rekaev 11.02.2023

import UIKit

// MARK: - Constants

private extension OffSet {
    
    /// 60 pixels on the 13 mini
    static let buttonHeight: CGFloat = .screenHeight / 13.533333333333333
    
    /// 219 pixels on the 13 mini
    static let buttonWidth: CGFloat = .screenWidth / 1.712328767123288
}

final class BottomView: UIView {
    
    // MARK: - Properties
    
    private let offerLabel: UILabel = BottomView.makeLabel(text: Localizable.Label.offer)
    private let offerButton: UIButton = BottomView.makeButton()
    
    var callback: (() -> Void)?
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setViewAppearance()
        offerButton.addTarget(nil, action: #selector(offerButtonPresed), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life cycle
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setViewPosition()
    }
    
}

// MARK: - Create subviews

private extension BottomView {
    
    static func makeLabel(text: String = "Label") -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = Fonts.SFProDisplay.regular.font(size: FontSize.small)
        label.textColor = Pallete.gray
        label.sizeToFit()
        return label
    }
    
    static func makeButton() -> UIButton {
        let button = UIButton()
        button.backgroundColor = Pallete.black
        button.layer.cornerRadius = OffSet.buttonHeight / 2
        button.setTitle(Localizable.Button.send, for: .normal)
        button.setTitleColor(Pallete.white, for: .normal)
        button.titleLabel?.font = Fonts.SFProDisplay.medium.font(size: FontSize.medium)
        return button
    }
}

// MARK: - Action

@objc
private extension BottomView {
    
    func offerButtonPresed() {
        callback?()
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
            offerLabel.centerYAnchor.constraint(equalTo: offerButton.centerYAnchor),
            offerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: OffSet.padding),
            
            offerButton.topAnchor.constraint(equalTo: topAnchor, constant: OffSet.top),
            offerButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -OffSet.padding),
            offerButton.widthAnchor.constraint(equalToConstant: OffSet.buttonWidth),
            offerButton.heightAnchor.constraint(equalToConstant: OffSet.buttonHeight)
        ])
    }
    
}
