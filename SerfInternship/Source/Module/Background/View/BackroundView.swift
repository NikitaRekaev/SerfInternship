//  BackgroundView.swift
//  Nikita Rekaev 10.02.2023

import UIKit

final class BackgroundView: UIView {
    
    // MARK: - Properties
    
    private let backgroundImageView: UIImageView = BackgroundView.makeImageView()
    
    // MARK: - Life cycle
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setViewPosition()
    }
    
}

// MARK: - Creating views

private extension BackgroundView {
    
    static func makeImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.image = Assets.background.image
        return imageView
    }
    
}

// MARK: - Private methods

private extension BackgroundView {
    
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
