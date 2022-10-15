//
//  ViewController.swift
//  hammer
//
//  Created by Максим Половинкин on 13.10.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(named: "profile"), tag: 0)
        
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
       //table.frame = view.bounds
        tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(named: "profile"), tag: 0)
    }

}

