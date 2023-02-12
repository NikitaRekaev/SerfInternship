//  ContentViewController.swift
//  Nikita Rekaev 11.02.2023

import UIKit

final class ContentViewController: BaseViewController<ContentRootView> {
    
    // MARK: - Properties
    
    private var model = Tab.allCases.map { TabModel(title: $0.title, isSelected: false) }
    private var selectTab: TabModel?
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selfView.setCallback(callback: showAlert)
        selfView.setDelegate(delegate: self, dataSource: self)
    }
    
    private func getModelIndex(row: Int) -> Int {
        return row % model.count
    }
    
}

// MARK: - Collection delegate

extension ContentViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if model[indexPath.item] == selectTab {
            selectTab = nil
        } else {
            selectTab = model[indexPath.item]
        }
        
        collectionView.visibleCells.compactMap({ $0 as? CollectionViewCell }).forEach({ cell in
            guard let selectTab = selectTab else {
                cell.selectTab?.isSelected = false
                return
            }
            let cellSelectTab = cell.selectTab
            cell.selectTab?.isSelected = (selectTab == cellSelectTab)
        })
        
        collectionView.moveItem(at: indexPath, to: IndexPath(row: 0, section: 0))
        model.move(fromOffsets: IndexSet(integer: indexPath.item), toOffset: 0)
        collectionView.scrollToItem(at: IndexPath(row: 0, section: 0), at: .left, animated: true)
    }
    
}

// MARK: - Collection DataSource

extension ContentViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        model.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCell(cellType: CollectionViewCell.self, for: indexPath)
        cell.selectTab = model[indexPath.item]
        cell.setTitle(model[getModelIndex(row: indexPath.item)].title)
        
        return cell
    }
    
}

// MARK: - Collection FlowLayout

extension ContentViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let label = UILabel(frame: CGRect.zero)
        label.text = model[getModelIndex(row: indexPath.item)].title
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
