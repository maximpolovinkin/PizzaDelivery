//
//  TrashTableViewCell.swift
//  hammer
//
//  Created by Максим Половинкин on 17.03.2023.
//

import UIKit

protocol CustomCellDelegate: AnyObject {
    func didPressStepper(for cell: UITableViewCell)
}

class TrashTableViewCell: UITableViewCell {
    var currentId = 0
    weak var delegate: CustomCellDelegate?
    
    //MARK: - UI Elements
    let pizzaName: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 17)
        
        return label
    }()
    
    let pizzaParametres: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 11)
        label.textColor = .systemGray2
        
        return label
    }()
    
    let img: UIImageView = {
        let img = UIImageView()
        return img
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 17)
        
        return label
    }()
    
    let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        
        return button
    }()
    
    let stepper: TrashCustomStepper = {
        let stepper = TrashCustomStepper()
        stepper.addTarget(self, action: #selector(stepperChangedValue), for: .valueChanged)
        
        return stepper
    }()
    
    //MARK: - Actions
    @objc func stepperChangedValue(sender: TrashCustomStepper) {
        if sender.isDecremented{
            Cart.shareInstance().deleteItemFor(id: currentId, image: self.img.image!)
            Cart.shareInstance().updatePrice(stepperValue: stepper.currentValue, index: stepper.tag)
            delegate?.didPressStepper(for: self)
            sender.isDecremented = false
        } else {
            Cart.shareInstance().setItem(item: menuItems(id: currentId, title: pizzaName.text!, image: "Asf"))
            delegate?.didPressStepper(for: self)
            Cart.shareInstance().updatePrice(stepperValue: stepper.currentValue, index: stepper.tag)
        }
    }
    
    //MARK: - Helpers
    func configure(steppetValue: Int, pizzaName: String, image: UIImage, currentId: Int, pizzaParamentes: String, delegate: CustomCellDelegate, tag: Int, price: Int) {
        self.stepper.currentValue = steppetValue
        self.pizzaName.text = pizzaName
        self.img.image = image
        self.currentId = currentId
        self.pizzaParametres.text = pizzaParamentes
        self.priceLabel.text = "\(price) ₽"
        self.delegate = delegate
        self.stepper.tag = tag
        priceLabel.sizeToFit()
        self.pizzaName.sizeToFit()
    }
    
    func setConstraints(){
        img.translatesAutoresizingMaskIntoConstraints = false
        pizzaName.translatesAutoresizingMaskIntoConstraints = false
        pizzaParametres.translatesAutoresizingMaskIntoConstraints = false
        stepper.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            img.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            img.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            img.widthAnchor.constraint(equalToConstant: 100),
            img.heightAnchor.constraint(equalToConstant: 100),
            
            pizzaName.leftAnchor.constraint(equalTo: self.leftAnchor, constant: img.bounds.width + 20),
            pizzaName.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            pizzaName.heightAnchor.constraint(equalToConstant: 35),
            pizzaName.widthAnchor.constraint(equalToConstant: 171),
            
            pizzaParametres.leftAnchor.constraint(equalTo: self.leftAnchor, constant: img.bounds.width + 20),
            pizzaParametres.topAnchor.constraint(equalTo: pizzaName.bottomAnchor, constant: -5),
            pizzaParametres.widthAnchor.constraint(equalToConstant: 220),
            pizzaParametres.heightAnchor.constraint(equalToConstant: 11),
            
            stepper.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
            stepper.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            stepper.heightAnchor.constraint(equalToConstant: 30),
            stepper.widthAnchor.constraint(equalToConstant: 110)
        ])
    }
    
    //MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(pizzaName)
        addSubview(pizzaParametres)
        addSubview(img)
        addSubview(priceLabel)
        addSubview(stepper)
        
        priceLabel.text = "345 ₽"
        pizzaName.frame = CGRect(x: 120, y: 10, width: 171, height: 52)
        pizzaParametres.frame = CGRect(x: 120, y: 67, width: 200, height: 11)
        img.frame = CGRect(x: 10, y: 10, width: 100, height: 100)
        priceLabel.frame = CGRect(x: 120, y: 90, width: 50, height: 20)
        stepper.frame = CGRect(x: 200, y: 90, width: 50, height: 30)
        stepper.layer.cornerRadius = stepper.bounds.height / 2
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
