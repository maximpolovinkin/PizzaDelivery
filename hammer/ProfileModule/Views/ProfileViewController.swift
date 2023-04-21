//
//  ViewController.swift
//  hammer
//
//  Created by Максим Половинкин on 13.10.2022.
//

import UIKit

class ProfileViewController: UIViewController{
    var presenter: ProfilePresenter?
    
     //MARK:  - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
    }
    
    //MARK:  - UI Elements
    let view1: UIView = {
        let view = UIView()
        view.backgroundColor = .white
       
        return view
    }()
    
    let userImage: UIImageView = {
        let img = UIImageView()
        img.frame = CGRect(x: 0, y: 0, width: 50, height: 70)
        img.layer.cornerRadius = img.bounds.height / 2
        img.backgroundColor = .gray
        
        return img
    }()
    
    let userName: UIButton = {
        let button = UIButton()
        button.setTitle("Илья 🖋", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        button.addTarget(self, action: #selector(didTapName), for: .touchUpInside)
        
        return button
    }()
    
    let cashBackButton : UIButton = {
        let cashBackButton = UIButton(frame:CGRect(x: 0, y: 0, width: 0, height: 0))
        cashBackButton.backgroundColor = UIColor(named: "priceColor")
        cashBackButton.layer.cornerRadius = 15
        cashBackButton.setTitle("Ваш кешбэк 10%", for: .normal)
        cashBackButton.titleLabel?.font = .boldSystemFont(ofSize: 17)
        cashBackButton.titleLabel?.textColor = .white
        
        return cashBackButton
    }()
    
    let phoneNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "+7 (919) 007-62-81"
        
        return label
    }()
    
    let leftBinusButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 150, height: 90)
        button.setTitle("100 Бонусов", for: .normal)
        button.setTitleColor(UIColor(named: "priceColor"), for: .normal)
        button.layer.cornerRadius = 30
        button.backgroundColor = .white
        button.layer.borderWidth = 1.0
        button.layer.borderColor = CGColor(red: 0.914, green: 0.302, blue: 0.424, alpha: 1.0)
        

        return button
    }()
    
    let rightBinusButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 150, height: 90)
        button.setTitle("Промо - Бонусов", for: .normal)
        button.setTitleColor(UIColor(named: "priceColor"), for: .normal)
        button.layer.cornerRadius = 30
        button.backgroundColor = .white
        button.layer.borderWidth = 1.0
        button.layer.borderColor = CGColor(red: 0.914, green: 0.302, blue: 0.424, alpha: 1.0)
        button.clipsToBounds = true
        
        return button
    }()
    
    let bonusHistoryButton: profileButton = {
        let button = profileButton()
        button.textLabel.text = "История бонусов"
        button.frame = CGRect(x: 0, y: 0, width: 200, height: 60)
        button.layer.cornerRadius = button.bounds.height / 2
        button.backgroundColor = .white
        
        return button
    }()
    
    let orderistoryButton: profileButton = {
        let button = profileButton()
        button.textLabel.text = "История заказов"
        button.frame = CGRect(x: 0, y: 0, width: 200, height: 60)
        button.layer.cornerRadius = button.bounds.height / 2
        button.backgroundColor = .white
        
        return button
    }()
    
    let adressButton: profileButton = {
        let button = profileButton()
        button.textLabel.text = "Адреса доставки"
        button.frame = CGRect(x: 0, y: 0, width: 200, height: 60)
        button.layer.cornerRadius = button.bounds.height / 2
        button.backgroundColor = .white
        
        return button
    }()
    
    let paymentHistoryButton: profileButton = {
        let button = profileButton()
        button.textLabel.text = "Способы оплаты"
        button.frame = CGRect(x: 0, y: 0, width: 200, height: 60)
        button.layer.cornerRadius = button.bounds.height / 2
        button.backgroundColor = .white
        
        return button
    }()

    //MARK:  - Actions
    @objc func userInfoPressed() {
        
    }
    
    @objc func didTapName() {
        print("sdfsf")
    }
    
    //MARK: - Helpers
    func setViews() {
        view.backgroundColor = .systemGroupedBackground
        tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(named: "profile"), tag: 0)
      
        view1.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 250)
        view1.layer.cornerRadius = 30
        
        view1.addSubview(userImage)
        view1.addSubview(userName)
        view1.addSubview(phoneNumberLabel)
        view1.addSubview(cashBackButton)
        view.addSubview(view1)
        view.addSubview(leftBinusButton)
        view.addSubview(rightBinusButton)
        view.addSubview(orderistoryButton)
        view.addSubview(paymentHistoryButton)
        view.addSubview(adressButton)
        view.addSubview(bonusHistoryButton)
        
        setConstraints()
    }
    
    func setConstraints() {
        view1.translatesAutoresizingMaskIntoConstraints = false
        userImage.translatesAutoresizingMaskIntoConstraints = false
        userName.translatesAutoresizingMaskIntoConstraints = false
        phoneNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        cashBackButton.translatesAutoresizingMaskIntoConstraints = false
        leftBinusButton.translatesAutoresizingMaskIntoConstraints = false
        rightBinusButton.translatesAutoresizingMaskIntoConstraints = false
        bonusHistoryButton.translatesAutoresizingMaskIntoConstraints = false
        paymentHistoryButton.translatesAutoresizingMaskIntoConstraints = false
        adressButton.translatesAutoresizingMaskIntoConstraints = false
        orderistoryButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            view1.leftAnchor.constraint(equalTo: view.leftAnchor),
            view1.rightAnchor.constraint(equalTo: view.rightAnchor),
            view1.topAnchor.constraint(equalTo: view.topAnchor, constant: -15),
            view1.heightAnchor.constraint(equalToConstant: 250),
            
            userImage.widthAnchor.constraint(equalToConstant: 70),
            userImage.leftAnchor.constraint(equalTo: view1.leftAnchor, constant: 20),
            userImage.heightAnchor.constraint(equalToConstant: 70),
            userImage.bottomAnchor.constraint(equalTo: view1.bottomAnchor, constant: -65),
            
            userName.heightAnchor.constraint(equalToConstant: 40),
            userName.leftAnchor.constraint(equalTo: userImage.rightAnchor, constant: 10),
            userName.topAnchor.constraint(equalTo: userImage.topAnchor),
            userName.widthAnchor.constraint(greaterThanOrEqualTo: userImage.widthAnchor),
            
            phoneNumberLabel.heightAnchor.constraint(equalToConstant: 20),
            phoneNumberLabel.leftAnchor.constraint(equalTo: userName.leftAnchor),
            phoneNumberLabel.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 5),
            phoneNumberLabel.widthAnchor.constraint(greaterThanOrEqualTo: userName.widthAnchor),
            
            cashBackButton.leftAnchor.constraint(equalTo: userImage.leftAnchor),
            cashBackButton.rightAnchor.constraint(equalTo: view1.rightAnchor, constant: -20),
            cashBackButton.topAnchor.constraint(equalTo: phoneNumberLabel.bottomAnchor, constant: 20),
            cashBackButton.bottomAnchor.constraint(equalTo: view1.bottomAnchor, constant: -20),
            
            leftBinusButton.topAnchor.constraint(equalTo: view1.bottomAnchor, constant: 20),
            leftBinusButton.leftAnchor.constraint(equalTo: cashBackButton.leftAnchor),
            leftBinusButton.heightAnchor.constraint(equalToConstant: 90),
            leftBinusButton.widthAnchor.constraint(equalToConstant: (view.bounds.width - 20 * 3) / 2),
            
            rightBinusButton.topAnchor.constraint(equalTo: leftBinusButton.topAnchor),
            rightBinusButton.leftAnchor.constraint(equalTo: leftBinusButton.rightAnchor, constant: 20),
            rightBinusButton.heightAnchor.constraint(equalToConstant: 90),
            rightBinusButton.widthAnchor.constraint(equalToConstant: (view.bounds.width - 20 * 3) / 2),
            
            orderistoryButton.topAnchor.constraint(equalTo: rightBinusButton.bottomAnchor, constant: 50),
            orderistoryButton.leftAnchor.constraint(equalTo: leftBinusButton.leftAnchor),
            orderistoryButton.heightAnchor.constraint(equalToConstant: 60),
            orderistoryButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            
            paymentHistoryButton.topAnchor.constraint(equalTo: orderistoryButton.bottomAnchor, constant: 20),
            paymentHistoryButton.leftAnchor.constraint(equalTo: leftBinusButton.leftAnchor),
            paymentHistoryButton.heightAnchor.constraint(equalToConstant: 60),
            paymentHistoryButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            
            adressButton.topAnchor.constraint(equalTo: paymentHistoryButton.bottomAnchor, constant: 20),
            adressButton.leftAnchor.constraint(equalTo: leftBinusButton.leftAnchor),
            adressButton.heightAnchor.constraint(equalToConstant: 60),
            adressButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            
            bonusHistoryButton.topAnchor.constraint(equalTo: adressButton.bottomAnchor, constant: 20),
            bonusHistoryButton.leftAnchor.constraint(equalTo: leftBinusButton.leftAnchor),
            bonusHistoryButton.heightAnchor.constraint(equalToConstant: 60),
            bonusHistoryButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
        ])
        
    }
}


//MARK:  - ProfileViewProtocol
extension ProfileViewController: ProfileViewProtocol {
    
}
