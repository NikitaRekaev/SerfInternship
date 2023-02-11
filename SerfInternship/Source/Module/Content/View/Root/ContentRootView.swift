//  ContentRootView.swift
//  Nikita Rekaev 11.02.2023

import UIKit

final class ContentRootView: UIView {
    
    // MARK: - Properties
    
    private let topView = TopView()
    private let middleView = MiddleView()
    private let bottomView = BottomView()
    
    // MARK: - Life cycle
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setViewAppearance()
        setViewPosition()
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
            topView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.4),
            
            middleView.topAnchor.constraint(equalTo: topView.bottomAnchor),
            middleView.leadingAnchor.constraint(equalTo: leadingAnchor),
            middleView.trailingAnchor.constraint(equalTo: trailingAnchor),
            middleView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.4),
            
            bottomView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: trailingAnchor),
            bottomView.bottomAnchor.constraint(equalTo: bottomAnchor),
            bottomView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.4)
        ])
    }
}
