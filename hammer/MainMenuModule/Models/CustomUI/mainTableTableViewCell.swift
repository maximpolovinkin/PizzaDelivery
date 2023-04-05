//
//  mainTableTableViewCell.swift
//  hammer
//
//  Created by Максим Половинкин on 15.10.2022.
//

import UIKit


class mainTableTableViewCell: UITableViewCell {
    
    //MARK: - Lifecycle
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setViews()
    }
    
    //MARK:  - UI Elements
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
    
    let textField: UITextField = {
        let tf = UITextField()
        tf.font = .systemFont(ofSize: 17)
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.sizeToFit()
        tf.frame = CGRect(x: 175, y: 5, width: 171, height: 5)
        
        return tf
    }()
    
    let descriptionTextField: UITextView = {
        let dtf = TextField()
        dtf.font = .systemFont(ofSize: 13)
        dtf.textColor = .systemGray2
        dtf.translatesAutoresizingMaskIntoConstraints = false
        dtf.frame = CGRect(x: 175, y: 50, width: 171, height: 64)
        
        return dtf
    }()
    
    let priceButton: UIButton = {
        let pb = UIButton()
        pb.backgroundColor = .white
        pb.layer.cornerRadius = 8
        pb.layer.borderWidth = 1
        pb.layer.borderColor =  UIColor(named: "priceColor")?.cgColor
        pb.setTitle("от 345 ₽", for: .normal)
        pb.setTitleColor(UIColor(named: "priceColor"), for: .normal)
        pb.titleLabel?.font = .systemFont(ofSize: 13)
        pb.frame = CGRect(x: 300, y: 125, width: 87, height: 32)
        pb.translatesAutoresizingMaskIntoConstraints = false
        
        return pb
    }()
    
    let img: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.frame = CGRect(x: 5, y: 5, width: 165, height: 165)
        
        return img
    }()
    
    //MARK: - UI Settings
    func setViews(){
        self.addSubview(textField)
        self.addSubview(descriptionTextField)
        self.addSubview(priceButton)
        self.addSubview(img)
        
        setConstraints()
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            textField.leftAnchor.constraint(equalTo: self.img.rightAnchor, constant: 5),
            textField.heightAnchor.constraint(greaterThanOrEqualToConstant: 5),
            textField.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -24),
            
            descriptionTextField.topAnchor.constraint(equalTo: self.topAnchor, constant: 44),
            descriptionTextField.leftAnchor.constraint(equalTo: self.img.rightAnchor, constant: 5),
            descriptionTextField.heightAnchor.constraint(greaterThanOrEqualToConstant: 64),
            descriptionTextField.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -24),
            
            img.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            img.widthAnchor.constraint(equalToConstant: 132),
            img.heightAnchor.constraint(equalToConstant: 132),
            img.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            
            priceButton.widthAnchor.constraint(equalToConstant: 87),
            priceButton.heightAnchor.constraint(equalToConstant: 32),
            priceButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -24),
            priceButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16)
        ])
    }
}
