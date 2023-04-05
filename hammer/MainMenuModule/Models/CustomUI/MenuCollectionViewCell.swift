//
//  MenuCollectionViewCell.swift
//  hammer
//
//  Created by Максим Половинкин on 14.10.2022.
//

import UIKit

class MenuCollectionViewCell: UICollectionViewCell {
    static let reuseId = "MenuCollectionViewCell"
    
    //MARK: - UI Elements
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "govno"
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.textColor =  #colorLiteral(red: 0.9701814055, green: 0.6653127074, blue: 0.7502200007, alpha: 1)
        label.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override var isSelected: Bool {
        didSet {
            backgroundColor = self.isSelected ? #colorLiteral(red: 0.961158812, green: 0.8141586185, blue: 0.8644768596, alpha: 1) : #colorLiteral(red: 0.9511643052, green: 0.9611130357, blue: 0.9781431556, alpha: 1)
            layer.borderColor =  self.isSelected ? #colorLiteral(red: 0.961158812, green: 0.8141586185, blue: 0.8644768596, alpha: 1) : #colorLiteral(red: 0.9701814055, green: 0.6653127074, blue: 0.7502200007, alpha: 1)
            nameLabel.textColor =  self.isSelected ? #colorLiteral(red: 0.9918184876, green: 0.229468286, blue: 0.4139637053, alpha: 1) : #colorLiteral(red: 0.9701814055, green: 0.6653127074, blue: 0.7502200007, alpha: 1)
            nameLabel.font = self.isSelected ?
                .systemFont(ofSize: 13, weight: .bold) :
                .systemFont(ofSize: 13, weight: .regular)
        }
    }
    
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = #colorLiteral(red: 0.9511643052, green: 0.9611130357, blue: 0.9781431556, alpha: 1)
        self.layer.borderColor =  #colorLiteral(red: 0.9701814055, green: 0.6653127074, blue: 0.7502200007, alpha: 1)
        self.layer.borderWidth = 1.0
        self.layer.cornerRadius = self.bounds.height / 2
        
        addSubview(nameLabel)
        setConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - UI Settings
    func setConstrains() {
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
