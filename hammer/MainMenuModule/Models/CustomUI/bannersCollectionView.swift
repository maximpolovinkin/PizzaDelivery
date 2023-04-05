//
//  bannersCollectionView.swift
//  hammer
//
//  Created by Максим Половинкин on 14.10.2022.
//

import UIKit

class bannersCollectionView: UICollectionView{
    var cells = [banner]()
    
    //MARK: - Lifecycle
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        delegate = self
        dataSource = self
        backgroundColor = .init(named: "Color")
        register(BannersCollectionViewCell.self, forCellWithReuseIdentifier: BannersCollectionViewCell.reuseId)
        
        translatesAutoresizingMaskIntoConstraints = false
        showsHorizontalScrollIndicator = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    func sett(cells: [banner]) {
        self.cells = cells
    }
}

//MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension bannersCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: BannersCollectionViewCell.reuseId, for: indexPath) as! BannersCollectionViewCell
        cell.imageView.image = cells[indexPath.row].image
        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension bannersCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 350, height: 172)
    }
}
