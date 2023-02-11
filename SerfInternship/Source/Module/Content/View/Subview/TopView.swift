//  TopView.swift
//  Nikita Rekaev 11.02.2023

import UIKit

final class TopView: UIView {
    
    // MARK: - Properties
    
    private let titleLabel = TopView.makeLabel(text: Localizable.Label.title)
    private let textView = TopView.makeTextView(text: Localizable.Label.Subtitle.top)
//    private let collection = TopView.makeCollection()
    
    // MARK: - Life cycle
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = .yellow
        setViewPosition()
    }
    
}

// MARK: - Create subviews

private extension TopView {
    
    static func makeLabel(text: String = "Label") -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = Fonts.SFProDisplay.regular.font(size: 14)
        label.textColor = .black
        label.sizeToFit()
        return label
    }
    
    static func makeTextView(text: String = "TextView") -> UITextView {
        let textView = UITextView()
        textView.isEditable = false
        textView.text = text
        return textView
    }
    
    static func makeCollection() -> UICollectionView {
        let collection = UICollectionView()
        return collection
    }
    
}

// MARK: - Private methods

private extension TopView {
    
    func setViewPosition() {
        
    }
}
