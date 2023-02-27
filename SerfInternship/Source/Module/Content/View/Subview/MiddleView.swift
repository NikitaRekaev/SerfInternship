//  MiddleView.swift
//  Nikita Rekaev 11.02.2023

import UIKit

private extension OffSet {
    
    /// Two rows of collection + spacing
    static let twoSectionCollectionHeight: CGFloat = OffSet.collectionHeight * 2 + OffSet.spacing
}

final class MiddleView: UIView {
    
    // MARK: - Properties
    
    private lazy var label = makeLabel(text: Localizable.Label.Subtitle.middle)
    private lazy var collection = makeCollection(cell: CollectionViewCell.self)
    
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
    
    func setDelegate(dataSource: UICollectionViewDataSource?, delegate: UICollectionViewDelegate?) {
        collection.delegate = delegate
        collection.dataSource = dataSource
    }
    
}

// MARK: - Private methods

private extension MiddleView {
    
    func setViewAppearance() {
        backgroundColor = .systemBackground
    }
    
    func makeLabel(text: String = "Label") -> UILabel {
        let label = UILabel()
        label.numberOfLines = .zero
        label.text = text
        label.font = Fonts.SFProDisplay.regular.font(size: FontSize.small)
        label.textColor = Pallete.gray
        label.textAlignment = .left
        label.sizeToFit()
        return label
    }
    
    func makeCollection(cell: UICollectionViewCell.Type) -> UICollectionView {
        let layout = LeftAlignmentLayout(rowsCount: 2)
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = OffSet.spacing
        
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
    
    func setViewPosition() {
        [label, collection].forEach { addView($0) }
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor, constant: OffSet.spacing),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: OffSet.padding),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -OffSet.padding),
            
            collection.topAnchor.constraint(equalTo: label.bottomAnchor, constant: OffSet.spacing),
            collection.leadingAnchor.constraint(equalTo: leadingAnchor),
            collection.trailingAnchor.constraint(equalTo: trailingAnchor),
            collection.heightAnchor.constraint(equalToConstant: OffSet.twoSectionCollectionHeight)
        ])
    }
    
}
