//  TopView.swift
//  Nikita Rekaev 11.02.2023

import UIKit

final class TopView: UIView {
    
    // MARK: - Properties
    
    private let titleLabel = TopView.makeLabel(text: Localizable.Label.title)
    private let textView = TopView.makeTextView(text: Localizable.Label.Subtitle.top)
    private let collection = TopView.makeCollection(cell: CollectionViewCell.self)
    
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
    
    static func makeCollection(cell: UICollectionViewCell.Type) -> UICollectionView {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        collection.backgroundColor = .none
        collection.showsHorizontalScrollIndicator = false
        collection.register(cell)
        return collection
    }
    
}

// MARK: - Private methods

private extension TopView {
    
    func setViewAppearance() {
        backgroundColor = .systemBackground
    }
    
    func setViewPosition() {
        
    }
    
}
