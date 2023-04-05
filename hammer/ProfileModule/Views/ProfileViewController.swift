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
    
    let userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Илья 🖋"
        label.font = .boldSystemFont(ofSize: 18)
        label.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        
        return label
    }()
    
    let phoneNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "+7 (919) 007-62-81"
        
        return label
    }()
    
    let scroll: UIScrollView = {
        let view = UIScrollView()
        view.backgroundColor = .systemGroupedBackground
        view.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        
        return view
    }()
    
    let leftBinusButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 90, height: 70)
        button.layer.cornerRadius = button.bounds.height / 2
        button.backgroundColor = .red
        
        return button
    }()
    
    let rightBinusButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 90, height: 70)
        button.layer.cornerRadius = button.bounds.height / 2
        button.backgroundColor = .green
        
        return button
    }()
    
    let bonusHistoryButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 200, height: 40)
        button.layer.cornerRadius = button.bounds.height / 2
        button.backgroundColor = .blue
        
        return button
    }()
    
    //MARK:  - Actions
    @objc func userInfoPressed() {
        
    }
    
    //MARK: - Helpers
    func setViews() {
        view.backgroundColor = .systemGroupedBackground
        tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(named: "profile"), tag: 0)
      
        view1.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 250)
        view1.layer.cornerRadius = 30
        
        view1.addSubview(userImage)
        view1.addSubview(userNameLabel)
        view1.addSubview(phoneNumberLabel)
      //  view.addSubview(scroll)
        view.addSubview(view1)
       
        setConstraints()
    }
    
    func setConstraints() {
        view1.translatesAutoresizingMaskIntoConstraints = false
        userImage.translatesAutoresizingMaskIntoConstraints = false
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        phoneNumberLabel.translatesAutoresizingMaskIntoConstraints = false
       // scroll.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            view1.leftAnchor.constraint(equalTo: view.leftAnchor),
            view1.rightAnchor.constraint(equalTo: view.rightAnchor),
            view1.topAnchor.constraint(equalTo: view.topAnchor, constant: -15),
            view1.heightAnchor.constraint(equalToConstant: 250),
            
            userImage.widthAnchor.constraint(equalToConstant: 70),
            userImage.leftAnchor.constraint(equalTo: view1.leftAnchor, constant: 20),
            userImage.heightAnchor.constraint(equalToConstant: 70),
            userImage.bottomAnchor.constraint(equalTo: view1.bottomAnchor, constant: -65),
            
            userNameLabel.heightAnchor.constraint(equalToConstant: 40),
            userNameLabel.leftAnchor.constraint(equalTo: userImage.rightAnchor, constant: 10),
            userNameLabel.topAnchor.constraint(equalTo: userImage.topAnchor),
            userNameLabel.widthAnchor.constraint(greaterThanOrEqualTo: userImage.widthAnchor),
            
            phoneNumberLabel.heightAnchor.constraint(equalToConstant: 20),
            phoneNumberLabel.leftAnchor.constraint(equalTo: userNameLabel.leftAnchor),
            phoneNumberLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 5),
            phoneNumberLabel.widthAnchor.constraint(greaterThanOrEqualTo: userNameLabel.widthAnchor),
            
//            scroll.leftAnchor.constraint(equalTo: view.leftAnchor),
//            scroll.rightAnchor.constraint(equalTo: view.rightAnchor),
//            scroll.topAnchor.constraint(equalTo: view1.bottomAnchor, constant: -50),
//            scroll.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}


//MARK:  - ProfileViewProtocol
extension ProfileViewController: ProfileViewProtocol {
    
}
