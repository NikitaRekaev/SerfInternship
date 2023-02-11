//  MiddleView.swift
//  Nikita Rekaev 11.02.2023

import UIKit

final class MiddleView: UIView {
    
    // MARK: - Properties
    
    private let textView = MiddleView.makeTextView(text: Localizable.Label.Subtitle.middle)
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
    
    static func makeTextView(text: String = "TextView") -> UITextView {
        let textView = UITextView()
        textView.isEditable = false
        textView.text = text
        textView.font = Fonts.SFProDisplay.regular.font(size: 14)
        textView.textColor = .lightGray
        textView.textAlignment = .left
        return textView
    }
    
    static func makeCollection(cell: UICollectionViewCell.Type) -> UICollectionView {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.minimumLineSpacing = 12
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
        [textView, collection].forEach { addView($0) }
        
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: topAnchor),
            textView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            textView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            textView.heightAnchor.constraint(equalToConstant: 40),
            
            collection.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 12),
            collection.leadingAnchor.constraint(equalTo: leadingAnchor),
            collection.trailingAnchor.constraint(equalTo: trailingAnchor),
            collection.heightAnchor.constraint(equalToConstant: 101)
        ])
    }
    
}
