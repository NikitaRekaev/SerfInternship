//  LeftAlignmentLayout.swift
//  Nikita Rekaev 12.02.2023

import UIKit

final class LeftAlignmentLayout: UICollectionViewFlowLayout {
    
    // MARK: - Properties
    
    let rowsCount: Int
    
    // MARK: - Initialization
    
    init(rowsCount: Int) {
        self.rowsCount = rowsCount
        super.init()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Overrided methods
    
    override func layoutAttributesForElements(
        in rect: CGRect
    ) -> [UICollectionViewLayoutAttributes]? {

        guard let attributes = super.layoutAttributesForElements(in: rect) else { return [] }
        
        var xRows: [Double] = Array(repeating: .zero, count: self.rowsCount)
        var cRow: Int = .zero
        var y: Double = .zero
        
        for attribute in attributes {
            if attribute.representedElementCategory != .cell { continue }

            attribute.frame.origin.x = xRows[cRow]
            xRows[cRow] += attribute.frame.width + minimumInteritemSpacing
            y += attribute.frame.maxY + minimumInteritemSpacing
            
            cRow += 1
            
            if cRow > self.rowsCount - 1 {
                cRow = .zero
                y = attribute.frame.maxY
            }
        }
        
        return attributes
    }

}
