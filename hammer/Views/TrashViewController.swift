//
//  TrashViewController.swift
//  hammer
//
//  Created by Максим Половинкин on 13.10.2022.
//

import UIKit

class TrashViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tabBarItem = UITabBarItem(title: "Корзина", image: UIImage(named: "trash"), tag: 0)
    }
}
