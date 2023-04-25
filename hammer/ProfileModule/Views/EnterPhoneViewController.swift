//
//  EnterPhoneViewController.swift
//  hammer
//
//  Created by Максим Половинкин on 23.04.2023.
//

import Foundation
import UIKit
import FlagPhoneNumber
import FirebaseAuth

class EnterPhoneViewController: UIViewController {
    var presenter: EnterPhonePresenter?
    private let codeController = EnterCodeViewController()
    private var listView: FPNCountryListViewController?
    private var phoneNumber = ""
    
    //MARK: - VC lifecycle
    override func viewDidLoad() {
        setViews()
    }
    
    //MARK: - UI Elements
    let phoneNumberTextfield: FPNTextField = {
        let text = FPNTextField()
        text.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        text.backgroundColor = .white
        text.layer.borderWidth = 1
        text.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0.7)
        text.font = .systemFont(ofSize: 20)
        text.displayMode = .list
        
        return text
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        label.text = "Введите номер телефона"
        label.font = .boldSystemFont(ofSize: 23)
        
        return label
    }()
    
    let button: UIButton = {
        let button = UIButton(frame:CGRect(x: 15, y: 750, width: 320, height: 60))
        button.backgroundColor = UIColor(named: "priceColor")
        button.layer.cornerRadius = button.bounds.height / 2
        button.setTitle("Продолжить", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 17)
        button.titleLabel?.textColor = .white
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.alpha = 0.5
        button.isEnabled = false
        
        return button
    }()
    
    
     //MARK: - Actions
    @objc func buttonPressed() {
        presenter?.didTapButton(telephoneNumber: phoneNumber, view: self)
    }
    
    @objc func claose() {
        print("Asaf")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first as? UITouch {
            phoneNumberTextfield.endEditing(true)
        }
    }
    
    //MARK: - UI Settings
    func setViews() {
        let backButton = UIBarButtonItem()
        backButton.title = "Телефон"
        navigationItem.backBarButtonItem = backButton
        tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(named: "profile"), tag: 0)
        listView = FPNCountryListViewController(style: .grouped)
        listView?.setup(repository: phoneNumberTextfield.countryRepository)
        phoneNumberTextfield.delegate = self
        
        self.view.backgroundColor = .white
        self.view.addSubview(button)
        self.view.addSubview(label)
        self.view.addSubview(phoneNumberTextfield)
        
        setConstraints()
        
        listView?.didSelect = {country in
            self.phoneNumberTextfield.setFlag(countryCode: country.code)
        }
    }
    
    func setConstraints() {
        button.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        phoneNumberTextfield.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 35),
            button.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -35),
            button.heightAnchor.constraint(equalToConstant: 60),
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -360),
            
            phoneNumberTextfield.leftAnchor.constraint(equalTo: button.leftAnchor),
            phoneNumberTextfield.rightAnchor.constraint(equalTo: button.rightAnchor),
            phoneNumberTextfield.heightAnchor.constraint(equalToConstant: 70),
            phoneNumberTextfield.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -20),
            
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.bottomAnchor.constraint(equalTo: phoneNumberTextfield.topAnchor, constant: -50),
            label.widthAnchor.constraint(greaterThanOrEqualToConstant: 20),
            label.heightAnchor.constraint(greaterThanOrEqualToConstant: 20)
        ])
        phoneNumberTextfield.layer.cornerRadius = 25
    }
}

 //MARK: - UITextFieldDelegate
extension EnterPhoneViewController: FPNTextFieldDelegate{
    func fpnDidSelectCountry(name: String, dialCode: String, code: String) {
        
    }
    
    func fpnDidValidatePhoneNumber(textField: FlagPhoneNumber.FPNTextField, isValid: Bool) {
        if isValid {
            button.alpha = 1
            button.isEnabled = true
            if let number = textField.getFormattedPhoneNumber(format: .International) {
                phoneNumber = number
            }
        } else {
            button.alpha = 0.5
            button.isEnabled = false
        }
    }
    
    func fpnDisplayCountryList() {
        let navVc = UINavigationController(rootViewController: listView!)
        listView?.title = "Телефонный код страны"
        listView?.navigationItem.leftBarButtonItem = UIBarButtonItem(systemItem: .close)
        phoneNumberTextfield.text = ""
        self.present(navVc, animated: true)
    }
}

extension EnterPhoneViewController: EnterPhoneViewProtocol {
    
}
