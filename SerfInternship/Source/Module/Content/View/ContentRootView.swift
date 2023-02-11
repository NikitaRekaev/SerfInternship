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
        setViewPosition()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Private methods

private extension ContentRootView {
    
    func setViewPosition() {
        [topView, middleView, bottomView].forEach { addView($0) }
        
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: topAnchor),
            topView.leadingAnchor.constraint(equalTo: leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: trailingAnchor),
            topView.heightAnchor.constraint(equalToConstant: 200),
            
            middleView.topAnchor.constraint(equalTo: topView.bottomAnchor),
            middleView.leadingAnchor.constraint(equalTo: leadingAnchor),
            middleView.trailingAnchor.constraint(equalTo: trailingAnchor),
            middleView.heightAnchor.constraint(equalToConstant: 200),
            
            bottomView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: trailingAnchor),
            bottomView.bottomAnchor.constraint(equalTo: bottomAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
}
