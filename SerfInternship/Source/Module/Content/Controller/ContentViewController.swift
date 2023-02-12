//  ContentViewController.swift
//  Nikita Rekaev 11.02.2023

import UIKit

final class ContentViewController: BaseViewController<ContentRootView> {
    
    // MARK: - Properties
    
    private let model = Tab.allCases
    private var selectTab: Tab?
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selfView.setCallback(callback: showAlert)
        selfView.setDelegate(delegate: self, dataSource: self)
        print(OffSet.viewHeight)
    }
    
}

// MARK: - Collection delegate

extension ContentViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let current = collectionView.cellForItem(at: indexPath)
        collectionView.visibleCells.compactMap({ $0 as? CollectionViewCell }).forEach({ cell in
            if current == cell {
                return
            }
            cell.isSelected = false
        })
        
        collectionView.scrollToItem(at: indexPath, at: .left, animated: true)
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
        
        return CGSize(width: label.frame.width + OffSet.top * 2,
                      height: OffSet.collectionHeight)
    }
    
}

// MARK: - Private methods

private extension ContentViewController {
    
    func showAlert() {
        let alert = UIAlertController(title: Localizable.Alert.title,
                                      message: Localizable.Alert.message,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: Localizable.Alert.action, style: .default))
        
        self.present(alert, animated: true, completion: nil)
    }
    
}
