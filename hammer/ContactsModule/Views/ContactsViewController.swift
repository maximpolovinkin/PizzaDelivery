//
//  ContactsViewController.swift
//  hammer
//
//  Created by Максим Половинкин on 13.10.2022.
//

import UIKit

class ContactsViewController: UIViewController, ContactsViewProtocol {
    
    let chatViewController = SupportChatController()
    var presenter: ContactsViewPresenterProtocol!

     //MARK: -  UI Settings
    let mapButton : UIButton = {
        let button = UIButton(frame: CGRect(x: 92, y: 200, width: 210, height: 50))
        button.setTitleColor(.init(named: "Color"), for: .normal)
        button.setTitle("Пиццерии на карте", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        
        button.layer.cornerRadius = button.bounds.height / 2
        button.backgroundColor =  UIColor(named: "priceColor")
        
        return button
    }()
    
    let callButton : UIButton = { // кнопка вызова поддержки
        let button = UIButton(frame: CGRect(x: 15, y: 5, width: 158, height: 50))
        button.setTitleColor(UIColor(named: "priceColor"), for: .normal)
        button.setTitle("Позвонить", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 17)

        button.layer.cornerRadius = button.bounds.height / 2
        button.backgroundColor = UIColor(named: "menuBgc")

        return button
    }()
    
    let chatButton : UIButton = { // кнопка вызова поддержки
        let button = UIButton(frame: CGRect(x: 193, y: 5, width: 158, height: 50))
        button.setTitle("Написать в чат", for: .normal)
        button.setTitleColor(UIColor(named: "priceColor"), for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 17)

        button.layer.cornerRadius = button.bounds.height / 2
        button.backgroundColor =  UIColor(named: "menuBgc")
        return button
    }()
    
    let supportLabel: UILabel = {
        let supportLabel = UILabel(frame: CGRect(x: 15, y: 300, width: 210, height: 50))
        supportLabel.text = "Связаться с поддержкой"
        supportLabel.textColor = .black
        supportLabel.font = .boldSystemFont(ofSize: 17)
        
        return supportLabel
    }()
 
    
    let buttonsStack : UIStackView = {
        let buttonsStack = UIStackView(frame: CGRect(x: 10, y: 350, width: 345, height: 40))
        buttonsStack.spacing = 10
        buttonsStack.axis = .horizontal
      
        return buttonsStack
    }()
    
    let imageView : UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 92, y: 60, width: 210, height: 210))
        imageView.backgroundColor = .black
        imageView.layer.cornerRadius = imageView.bounds.height / 2
        imageView.image = UIImage(named: "map")
        imageView.layer.borderColor = .init(red: 16, green: 16, blue: 16, alpha: 10)
        
        return imageView
    }()
    
    func setUpViews() {
        view.addSubview(imageView)
        view.addSubview(mapButton)
        view.addSubview(supportLabel)
        buttonsStack.addSubview(callButton)
        buttonsStack.addSubview(chatButton)
        
        view.addSubview(buttonsStack)
    }

     //MARK: - VC Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tabBarItem = UITabBarItem(title: "Контакты", image: UIImage(named: "contacts"), tag: 0)
        setUpViews()
        setActions()
       
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tabBarItem = UITabBarItem(title: "Контакты", image: UIImage(named: "contacts"), tag: 0)
    }
    
    //MARK: - Actions
    func setActions(){ // was added cuz caught unrecognized selector sent to class
        mapButton.addTarget(self, action: #selector(openURL), for: .touchUpInside)
        callButton.addTarget(self, action: #selector(call), for: .touchUpInside)
        chatButton.addTarget(self, action: #selector(startChat), for: .touchUpInside)
    }

    @objc func openURL() {
        presenter.didTapURL()
    }
    
    @objc func call() {
        presenter.didTapCall()
    }
    
    @objc func startChat() {
        presenter.didTapChat()
    }
}
