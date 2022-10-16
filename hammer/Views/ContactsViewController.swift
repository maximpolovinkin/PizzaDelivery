//
//  ContactsViewController.swift
//  hammer
//
//  Created by Максим Половинкин on 13.10.2022.
//

import UIKit

class ContactsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        tabBarItem = UITabBarItem(title: "Контакты", image: UIImage(named: "contacts"), tag: 0)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tabBarItem = UITabBarItem(title: "Контакты", image: UIImage(named: "contacts"), tag: 0)
    }
}
