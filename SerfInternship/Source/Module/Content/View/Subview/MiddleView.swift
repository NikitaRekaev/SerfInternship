//  MiddleView.swift
//  Nikita Rekaev 11.02.2023

import UIKit

final class MiddleView: UIView {
    
    // MARK: - Properties
    
    private let label = MiddleView.makeLabel(text: Localizable.Label.Subtitle.middle)
    private let collection = MiddleView.makeCollection(cell: CollectionViewCell.self)
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setViewAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life cycle
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setViewPosition()
    }
    
    // MARK: - Internal methods
    
    func setDelegate(delegate: UICollectionViewDelegate, dataSource: UICollectionViewDataSource) {
        collection.delegate = delegate
        collection.dataSource = dataSource
    }
    
}

// MARK: - Create subviews

private extension MiddleView {
    
    static func makeLabel(text: String = "TextView") -> UILabel {
        let label = UILabel()
        label.numberOfLines = .zero
        label.text = text
        label.font = Fonts.SFProDisplay.regular.font(size: .screenHeight * 0.021)
        label.textColor = .lightGray
        label.textAlignment = .left
        label.sizeToFit()
        return label
    }
    
    static func makeCollection(cell: UICollectionViewCell.Type) -> UICollectionView {
        let layout = LeftAlignmentLayout(rowsCount: 2)
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 12
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        collection.backgroundColor = .none
        collection.showsHorizontalScrollIndicator = false
        collection.register(cell)
        return collection
    }
    
}

// MARK: - Private methods

private extension MiddleView {
    
    func setViewAppearance() {
        backgroundColor = .systemBackground
    }
    
    func setViewPosition() {
        [label, collection].forEach { addView($0) }
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            label.heightAnchor.constraint(equalToConstant: .screenHeight * 0.06),
            
            collection.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 12),
            collection.leadingAnchor.constraint(equalTo: leadingAnchor),
            collection.trailingAnchor.constraint(equalTo: trailingAnchor),
            collection.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
}
