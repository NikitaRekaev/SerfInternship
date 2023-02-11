//  CollectionViewCell.swift
//  Nikita Rekaev 11.02.2023

import UIKit

final class CollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    private let label = CollectionViewCell.makeLabel()
    
    // MARK: - Life cycle
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setViewPosition()
    }
    
    // MARK: - Public methods
    
    func setTitle(_ title: String) {
        label.text = title
    }
    
}

// MARK: - Creating subviews

private extension CollectionViewCell {
    
    static func makeLabel(text: String = "Label") -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = Fonts.SFProDisplay.medium.font(size: 14)
        label.textColor = .black
        label.sizeToFit()
        return label
    }
    
}

// MARK: - Private methods

private extension CollectionViewCell {
    
    func setViewPosition() {
        contentView.addView(label)
        
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
    
}
