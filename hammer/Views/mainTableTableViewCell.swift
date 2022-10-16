//
//  mainTableTableViewCell.swift
//  hammer
//
//  Created by Максим Половинкин on 15.10.2022.
//

import UIKit

class mainTableTableViewCell: UITableViewCell {
    
    class TextField: UITextView {
         func textRect(forBounds bounds: CGRect) -> CGRect {
            return bounds.insetBy(dx: 40, dy: 20)
        }
        
         func editingRect(forBounds bounds: CGRect) -> CGRect {
            return bounds.insetBy(dx: 24, dy: 20)
        }
        
        override var intrinsicContentSize: CGSize {
            return .init(width: 0, height: 44)
        }
        
        
    }
    
    let textField: UITextView = {
        let tf = TextField()
        tf.font = .systemFont(ofSize: 17)
        tf.translatesAutoresizingMaskIntoConstraints = false
        
        return tf
    }()
    
    let descriptionTextField: UITextView = {
        let dtf = TextField()
        dtf.font = .systemFont(ofSize: 13)
        dtf.textColor = .systemGray2
        dtf.translatesAutoresizingMaskIntoConstraints = false
        
        return dtf
    }()
    
    let priceButton: UIButton = {
        let pb = UIButton()
        pb.backgroundColor = .white
        pb.layer.cornerRadius = 8
        pb.layer.borderWidth = 1
        pb.layer.borderColor =  UIColor(named: "priceColor")?.cgColor
        
        pb.setTitle("от 345 р", for: .normal)
        pb.setTitleColor(UIColor(named: "priceColor"), for: .normal)
        
        pb.titleLabel?.font = .systemFont(ofSize: 13)
        
        return pb
    }()
    
    let img: UIImageView = {
        let img = UIImageView()
        return img
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(textField)
        addSubview(descriptionTextField)
        addSubview(priceButton)
        addSubview(img)
        textField.frame = CGRect(x: 175, y: 5, width: 171, height: 52)
        descriptionTextField.frame = CGRect(x: 175, y: 50, width: 171, height: 74)
        priceButton.frame = CGRect(x: 305, y: 125, width: 87, height: 32)
        img.frame = CGRect(x: 5, y: 5, width: 165, height: 165)
    
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    


}
