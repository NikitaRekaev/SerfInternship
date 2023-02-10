//  MainRootView.swift
//  Nikita Rekaev 10.02.2023

import UIKit

final class MainRootView: UIView {
    
    // MARK: - Properties
    
    private let backgroundImageView: UIImageView = MainRootView.makeImageView()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setViewPosition()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Creating views

private extension MainRootView {
    
    static func makeImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.image = Assets.background.image
        return imageView
    }
    
}

// MARK: - Private methods

private extension MainRootView {
    
    func setViewPosition() {
        addView(backgroundImageView)
        
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
