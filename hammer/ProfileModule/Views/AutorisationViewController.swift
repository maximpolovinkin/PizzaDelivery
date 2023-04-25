//
//  AutorisationViewController.swift
//  hammer
//
//  Created by Максим Половинкин on 22.04.2023.
//

import Foundation
import UIKit

class AutorisationViewController: UIViewController {
    var presenter: AutorisationPresenter?
   
    //MARK: - VC lifecycle
    override func viewDidLoad() {
        setViews()
    }
    
    //MARK: - UI Elements
    let button: UIButton = {
        let button = UIButton(frame:CGRect(x: 15, y: 750, width: 320, height: 60))
        button.backgroundColor = UIColor(named: "priceColor")
        button.layer.cornerRadius = button.bounds.height / 2
        button.setTitle("Указать телефон", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 17)
        button.titleLabel?.textColor = .white
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        return button
    }()
    
    var catImage: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 100 , y: 200, width: 200, height: 200))
        image.image = UIImage(named: "catForAuth")
       
        return image
    }()
    
     //MARK: - Actions
    @objc func buttonPressed() {
        presenter?.didTapButton()
    }
    
    //MARK: - UI Settings
    func setViews() {
        tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(named: "profile"), tag: 0)
        self.view.backgroundColor = .white
        self.view.addSubview(button)
        self.view.addSubview(catImage)
        setConstraints()
    }
    
    func setConstraints() {
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 35),
            button.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -35),
            button.heightAnchor.constraint(equalToConstant: 60),
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -260)
        ])
    }
}


//MARK: - ProfileViewProtocol
extension AutorisationViewController: AutorisationViewProtocol {
    
}
