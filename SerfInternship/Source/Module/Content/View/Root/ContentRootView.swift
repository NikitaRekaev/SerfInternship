//  ContentRootView.swift
//  Nikita Rekaev 11.02.2023

import UIKit

final class ContentRootView: UIView {
    
    // MARK: - Properties
    
    private let topView = TopView()
    private let middleView = MiddleView()
    private let bottomView = BottomView()
    
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
    
    // MARK: - Iternal method
    
    func setInfiniteCollectionDelegate(dataSource: UICollectionViewDataSource?, delegate: UICollectionViewDelegate?) {
        topView.setDelegate(dataSource: dataSource, delegate: delegate)
    }
    
    func setAnimatedCollectionDelegate(dataSource: UICollectionViewDataSource?, delegate: UICollectionViewDelegate?) {
        middleView.setDelegate(dataSource: dataSource, delegate: delegate)
    }
    
    func setCallback(callback: (() -> Void)?) {
        bottomView.callback = callback
    }
    
}

// MARK: - Private methods

private extension ContentRootView {
    
    func setViewAppearance() {
        backgroundColor = .systemBackground
    }
    
    func setViewPosition() {
        [topView, middleView, bottomView].forEach { addView($0) }
        
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: topAnchor),
            topView.leadingAnchor.constraint(equalTo: leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: trailingAnchor),
            topView.heightAnchor.constraint(equalToConstant: OffSet.viewHeight),
            
            middleView.topAnchor.constraint(equalTo: topView.bottomAnchor),
            middleView.leadingAnchor.constraint(equalTo: leadingAnchor),
            middleView.trailingAnchor.constraint(equalTo: trailingAnchor),
            middleView.heightAnchor.constraint(equalToConstant: OffSet.viewHeight),
            
            bottomView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: trailingAnchor),
            bottomView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: OffSet.viewHeight)
        ])
    }
    
}
