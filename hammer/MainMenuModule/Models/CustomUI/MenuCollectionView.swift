//
//  MenuCollectionView.swift
//  hammer
//
//  Created by Максим Половинкин on 14.10.2022.
//
import Foundation
import UIKit

class MenuCollectionView: UICollectionView {
    var cells = [menu]()
    var colorChangeFlag = false
    var indexColor = IndexPath(row: 0, section: 0)
    
    //MARK: - Lifecycle
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        delegate = self
        dataSource = self
        backgroundColor = .init(named: "Color")
        register(MenuCollectionViewCell.self, forCellWithReuseIdentifier: MenuCollectionViewCell.reuseId)
        self.showsHorizontalScrollIndicator = false
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    func sett(cells: [menu]) {
        self.cells = cells
    }
}

 //MARK: - UICollectionView
extension MenuCollectionView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: MenuCollectionViewCell.reuseId, for: indexPath) as! MenuCollectionViewCell
        cell.layer.cornerRadius = cell.bounds.height / 2
        cell.nameLabel.text = menu.categoryNames[indexPath.row]
        if indexPath.row == 0 {
            collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 88, height: 32)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.item {
        case 0:
            let index = IndexPath(row: 0, section: 0)
            table.scrollToRow(at: index, at: .none, animated: true)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            return
        case 1:
            let index = IndexPath(row: 5, section: 0)
            table.scrollToRow(at: index, at: .none, animated: true)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            return
        case 2:
            let index = IndexPath(row: 10, section: 0)
            table.scrollToRow(at: index, at: .none, animated: true)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            return
        case 3:
            let index = IndexPath(row: 15, section: 0)
            table.scrollToRow(at: index, at: .none, animated: true)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            return
        default:
            return
        }
    
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        if collectionView.cellForItem(at: indexPath)?.isSelected ?? false {
            collectionView.deselectItem(at: indexPath, animated: true)
            return false
        }
        return true
    }
}
