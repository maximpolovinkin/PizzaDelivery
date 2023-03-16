//
//  Router.swift
//  hammer
//
//  Created by Максим Половинкин on 02.03.2023.
//

import Foundation
import UIKit

protocol RouterMain {
    var tabBar: UITabBarController? {get set}
    var assemblyBuilder: AssamblyBuilderProtocol? {get set}
}

protocol RouterProtocol: RouterMain {
    func initialVC()
    func showDetail(menuItem: menuItems?, image: UIImage?)
    func updateTrash()
}

class Router: RouterProtocol {
    var tabBar: UITabBarController?
    var assemblyBuilder: AssamblyBuilderProtocol?
    
    required init(tabBar: UITabBarController?, assemblyBuilder: AssamblyBuilderProtocol?) {
        self.tabBar = tabBar
        self.assemblyBuilder = assemblyBuilder
    }
    
     //MARK: Tab Bar
    func initialVC() {
        if let tabBar = tabBar {
            guard let mainVc = assemblyBuilder?.createMenuModule(router: self),
                  let contactsVC = assemblyBuilder?.createContacntsModule(router: self),
                  let profileVC = assemblyBuilder?.createProfileModule(router: self),
                  let trashVC = assemblyBuilder?.createTrashModule(router: self) else {return}
        
            let trashNavVc = UINavigationController()
            trashNavVc.viewControllers = [trashVC]
            trashNavVc.navigationBar.topItem?.title = "Корзина"
            
            let profileNavVC = UINavigationController()
            profileNavVC.viewControllers = [profileVC]
            profileNavVC.navigationBar.topItem?.title = "Профиль"
            
            tabBar.viewControllers = [mainVc, contactsVC, profileNavVC, trashNavVc]
        }
    }
    
     //MARK: Detail pizza screen
    func showDetail(menuItem: menuItems?, image: UIImage?) {
        if let tabBar = tabBar {
            guard let detailVC = assemblyBuilder?.createDetailModule(menuItem: menuItem, image: image) else { return }
            detailVC.modalPresentationStyle = .fullScreen
            tabBar.present(detailVC, animated: true)
        }
    }
    
    func updateTrash() {
        
    }
}
