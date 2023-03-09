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
    func popRootVC()
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
            
            tabBar.viewControllers = [mainVc, contactsVC, profileVC, trashVC]
        }
    }
    
     //MARK: Detail pizza screen
    func showDetail(menuItem: menuItems?, image: UIImage?) {
        if let tabBar = tabBar {
            guard let detailVC = assemblyBuilder?.createDetailModule(menuItem: menuItem, image: image) else { return }
            tabBar.present(detailVC, animated: true)
        }
    }
    
    func popRootVC() {
        
    }
}
