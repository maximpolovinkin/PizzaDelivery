//
//  MenuCollectionView.swift
//  hammer
//
//  Created by Максим Половинкин on 14.10.2022.
//
import Foundation
import UIKit

class MenuCollectionView: UICollectionView , UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var cells = [menu]()
    var colorChangeFlag = false
    var indexColor = IndexPath(row: 0, section: 0)
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        delegate = self
        dataSource = self
        backgroundColor = .init(named: "Color")
        register(MenuCollectionViewCell.self, forCellWithReuseIdentifier: MenuCollectionViewCell.reuseId)
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func sett(cells: [menu]) {
        self.cells = cells
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = dequeueReusableCell(withReuseIdentifier: MenuCollectionViewCell.reuseId, for: indexPath) as! MenuCollectionViewCell
        
        cell.imageView.image = cells[indexPath.row].image
        cell.layer.cornerRadius = cell.bounds.height / 2
        print(indexPath.row)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 88, height: 32)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        switch indexPath.item {
        case 0:
            if(colorChangeFlag) {
                collectionView.cellForItem(at: indexColor)?.backgroundColor = .none
                colorChangeFlag = false
            }
            
            let index = IndexPath(row: 0, section: 0)
            colorChangeFlag = true
            indexColor = indexPath
            
            table.scrollToRow(at: index, at: .none, animated: true)
            collectionView.cellForItem(at: indexPath)?.backgroundColor = UIColor(named: "menuBgc")
            
            return
        case 1:
            if(colorChangeFlag) {
                collectionView.cellForItem(at: indexColor)?.backgroundColor = .none
                colorChangeFlag = false
            }
            
            colorChangeFlag = true
            indexColor = indexPath
    
            collectionView.cellForItem(at: indexPath)?.backgroundColor = UIColor(named: "menuBgc")
            let index = IndexPath(row: 5, section: 0)
            table.scrollToRow(at: index, at: .none, animated: true)
            return
        case 2:
            if(colorChangeFlag) {
                collectionView.cellForItem(at: indexColor)?.backgroundColor = .none
                colorChangeFlag = false
            }
            
            colorChangeFlag = true
            indexColor = indexPath
            
            collectionView.cellForItem(at: indexPath)?.backgroundColor = UIColor(named: "menuBgc")
            let index = IndexPath(row: 10, section: 0)
            table.scrollToRow(at: index, at: .none, animated: true)
            return
        case 3:
            if(colorChangeFlag) {
                collectionView.cellForItem(at: indexColor)?.backgroundColor = .none
                colorChangeFlag = false
            }
            
            colorChangeFlag = true
            indexColor = indexPath
            
            collectionView.cellForItem(at: indexPath)?.backgroundColor = UIColor(named: "menuBgc")
            let index = IndexPath(row: 15, section: 0)
            table.scrollToRow(at: index, at: .none, animated: true)
            return
        default:
            return
        }
    }
}


