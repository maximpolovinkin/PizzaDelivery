//
//  profileButton.swift
//  hammer
//
//  Created by Максим Половинкин on 21.04.2023.
//

import Foundation
import UIKit

class profileButton: UIButton {
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - UI Elements
    public let textLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = ""
        label.font = .systemFont(ofSize: 18)
        
        return label
    }()
    
    private let arrrow: UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "chevron.forward"))
        image.image!.withTintColor(UIColor(named: "priceColor")!)
        image.tintColor = UIColor(named: "priceColor")!
        
        return image
    }()
    
    //MARK: - UI Settings
    func setViews(){
        self.addSubview(textLabel)
        self.addSubview(arrrow)
        
        setConstraints()
    }
    
    func setConstraints(){
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        arrrow.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            textLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            textLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
            textLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 50),
            
            arrrow.topAnchor.constraint(equalTo: textLabel.topAnchor),
            arrrow.bottomAnchor.constraint(equalTo: textLabel.bottomAnchor),
            arrrow.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            arrrow.widthAnchor.constraint(greaterThanOrEqualToConstant: 2)
        ])
        
        textLabel.sizeToFit()
    }
}
