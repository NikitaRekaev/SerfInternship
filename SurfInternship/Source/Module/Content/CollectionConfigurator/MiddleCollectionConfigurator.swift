//  MiddleCollectionConfigurator.swift
//  Nikita Rekaev 24.02.2023

import UIKit

final class MiddleCollectionConfigurator: NSObject {

    // MARK: - Properties

    private var model = Tag.allCases.map { TagModel(title: $0.title, isSelected: false) }
    private var selectTab: TagModel?

    // MARK: - Private methods

    private func getModelIndex(row: Int) -> Int {
        return row % model.count
    }

}

// MARK: - Collection DataSource

extension MiddleCollectionConfigurator: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        model.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCell(cellType: CollectionViewCell.self, for: indexPath)
        cell.selectTab = model[indexPath.item]
        cell.setTitle(model[getModelIndex(row: indexPath.item)].title)

        return cell
    }

}

// MARK: - Collection Delegate

extension MiddleCollectionConfigurator: UICollectionViewDelegate {

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

        model.move(fromOffsets: IndexSet(integer: indexPath.item), toOffset: .zero)
        collectionView.moveItem(at: indexPath, to: IndexPath(row: .zero, section: .zero))
        collectionView.scrollToItem(at: IndexPath(row: .zero, section: .zero), at: .left, animated: true)
    }

}

// MARK: - Collection FlowLayout

extension MiddleCollectionConfigurator: UICollectionViewDelegateFlowLayout {

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
