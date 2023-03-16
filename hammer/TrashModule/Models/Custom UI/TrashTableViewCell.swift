//
//  TrashTableViewCell.swift
//  hammer
//
//  Created by Максим Половинкин on 17.03.2023.
//

import UIKit

class TrashTableViewCell: UITableViewCell {
    let pizzaName: UITextView = {
        let tf = UITextView()
        tf.font = .systemFont(ofSize: 17)
        tf.translatesAutoresizingMaskIntoConstraints = false
        
        return tf
    }()
    
    let pizzaParametres: UITextView = {
        let dtf = UITextView()
        dtf.font = .systemFont(ofSize: 13)
        dtf.textColor = .systemGray2
        dtf.translatesAutoresizingMaskIntoConstraints = false
        
        return dtf
    }()
    
    let img: UIImageView = {
        let img = UIImageView()
        return img
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(pizzaName)
        addSubview(pizzaParametres)
        addSubview(img)
        
        pizzaName.frame = CGRect(x: 175, y: 5, width: 171, height: 52)
        pizzaParametres.frame = CGRect(x: 175, y: 50, width: 171, height: 74)
        img.frame = CGRect(x: 5, y: 5, width: 165, height: 165)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstraints(){
        
    }
}
