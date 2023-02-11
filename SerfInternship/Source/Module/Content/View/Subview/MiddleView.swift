//  MiddleView.swift
//  Nikita Rekaev 11.02.2023

import UIKit

final class MiddleView: UIView {
    
    // MARK: - Properties
    
    private let textView = MiddleView.makeTextView()
//    private let collection = MiddleView.makeCollection()
    
    // MARK: - Life cycle
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = .green
        setViewPosition()
    }
    
}

// MARK: - Create subviews

private extension MiddleView {
    
    static func makeTextView() -> UITextView {
        let textView = UITextView()
        return textView
    }
    
    static func makeCollection() -> UICollectionView {
        let collection = UICollectionView()
        return collection
    }
    
}

// MARK: - Private methods

private extension MiddleView {
    
    func setViewPosition() {
        
    }
}
