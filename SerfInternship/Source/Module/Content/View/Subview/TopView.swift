//  TopView.swift
//  Nikita Rekaev 11.02.2023

import UIKit

final class TopView: UIView {
    
    // MARK: - Properties
    
    private let titleLabel = TopView.makeTitleLabel(text: Localizable.Label.title)
    private let discriptionLabel = TopView.makeDiscriptionLabel(text: Localizable.Label.Subtitle.top)
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
    
    static func makeTitleLabel(text: String = "Label") -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = Fonts.SFProDisplay.bold.font(size: FontSize.large)
        label.textColor = .black
        label.sizeToFit()
        return label
    }
    
    static func makeDiscriptionLabel(text: String = "Label") -> UILabel {
        let label = UILabel()
        label.numberOfLines = .zero
        label.text = text
        label.font = Fonts.SFProDisplay.regular.font(size: FontSize.small)
        label.textColor = .lightGray
        label.textAlignment = .left
        label.sizeToFit()
        return label
    }
    
    static func makeCollection(cell: UICollectionViewCell.Type) -> UICollectionView {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.minimumLineSpacing = OffSet.spacing
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .none
        collection.showsHorizontalScrollIndicator = false
        collection.register(cell)
        collection.contentInset = UIEdgeInsets(top: .zero,
                                               left: OffSet.padding,
                                               bottom: .zero,
                                               right: OffSet.padding)
        
        return collection
    }
    
}

// MARK: - Private methods

private extension TopView {
    
    func setViewAppearance() {
        backgroundColor = .systemBackground
    }
    
    func setViewPosition() {
        [titleLabel, discriptionLabel, collection].forEach { addView($0) }
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: OffSet.top),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: OffSet.padding),
            
            discriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: OffSet.spacing),
            discriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            discriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -OffSet.padding),
            
            collection.topAnchor.constraint(equalTo: discriptionLabel.bottomAnchor, constant: OffSet.spacing),
            collection.leadingAnchor.constraint(equalTo: leadingAnchor),
            collection.trailingAnchor.constraint(equalTo: trailingAnchor),
            collection.heightAnchor.constraint(equalToConstant: OffSet.collectionHeight)
        ])
    }
    
}
