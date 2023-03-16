//
//  ViewController.swift
//  hammer
//
//  Created by Максим Половинкин on 13.10.2022.
//

import UIKit
// Module is not done at all

class ProfileViewController: UIViewController, ProfileViewProtocol {
    var presenter: ProfilePresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(named: "profile"), tag: 0)
    }
}

