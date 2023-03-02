//
//  ViewController.swift
//  hammer
//
//  Created by Максим Половинкин on 13.10.2022.
//

import UIKit
// Module is not done at all

class ProfileViewController: UIViewController {
    var navBar = UINavigationBar(frame: CGRect(x: 0, y: 46, width: UIScreen.main.bounds.width, height: 40))
    
    func setNavigationBar() {
        let navItem = UINavigationItem(title: "Профиль")
        navBar.items?.append(navItem)
        navBar.barTintColor = .white
        self.view.addSubview(navBar)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavigationBar()
        
        tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(named: "profile"), tag: 0)
    }
}

