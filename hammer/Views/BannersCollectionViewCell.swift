//
//  BannersCollectionViewCell.swift
//  hammer
//
//  Created by Максим Половинкин on 14.10.2022.
//

import UIKit

class BannersCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "BannersCollectionViewCell"
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
       // imageView.backgroundColor = .gray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(imageView)
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
