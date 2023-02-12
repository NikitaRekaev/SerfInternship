//  CollectionViewCell.swift
//  Nikita Rekaev 11.02.2023

import UIKit

final class CollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    private let label = CollectionViewCell.makeLabel()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setViewApearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        label.font = Fonts.SFProDisplay.medium.font(size: FontSize.small)
        label.textColor = .black
        label.sizeToFit()
        return label
    }
    
}

// MARK: - Private methods

private extension CollectionViewCell {
    
    func setViewApearance() {
        contentView.backgroundColor = .lightGray.withAlphaComponent(0.3)
        contentView.layer.cornerRadius = OffSet.collectionHeight / 4
    }
    
    func setViewPosition() {
        contentView.addView(label)
        
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
    
}
