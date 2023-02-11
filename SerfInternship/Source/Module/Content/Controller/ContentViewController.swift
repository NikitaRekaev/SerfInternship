//  ContentViewController.swift
//  Nikita Rekaev 11.02.2023

import UIKit

final class ContentViewController: BaseViewController<ContentRootView> {
    
    // MARK: - Properties
    
    let model = Tab.allCases
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selfView.setDelegate(delegate: self, dataSource: self)
    }
    
}

// MARK: - Collection delegate

extension ContentViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
}

// MARK: - Collection DataSource

extension ContentViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        model.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCell(cellType: CollectionViewCell.self, for: indexPath)
        
        cell.setTitle(model[indexPath.item].title)
        
        return cell
    }
    
}

// MARK: - Collection FlowLayout

extension ContentViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let label = UILabel(frame: CGRect.zero)
        label.text = model[indexPath.item].title
        label.sizeToFit()
        
        return CGSize(width: label.frame.width + 58,
                      height: label.frame.height + 24)
    }
    
}
