//
//  Router.swift
//  hammer
//
//  Created by Максим Половинкин on 02.03.2023.
//

import Foundation
import UIKit

protocol RouterMain {
    var viewController: UIViewController? {get set}
    var assemblyBuilder: AssamblyBuilderProtocol? {get set}
}

protocol RouterProtocol: RouterMain {
   // func initialVC()
    func showDetail(menuItem: menuItems?)
    func popRootVC()
}

class Router: RouterProtocol {
    var viewController: UIViewController?
    // В ближайшем будущем здесь сделать не VC, a TabBarVC и далее испольщовать его в initialVC
    var assemblyBuilder: AssamblyBuilderProtocol?
    
    required init(viewController: UIViewController?, assemblyBuilder: AssamblyBuilderProtocol?) {
        self.viewController = viewController
        self.assemblyBuilder = assemblyBuilder
    }
    
    func initialVC() {
        if let viewController = viewController {
            guard let mainVC = assemblyBuilder?.createMenuModule(router: self) else { return }
            print("Ok")
        }
    }
    
    func showDetail(menuItem: menuItems?) {
        if let viewController = viewController {
            guard let detailVC = assemblyBuilder?.createDetailModule(menuItem: menuItem) else { return }
            viewController.present(detailVC, animated: true)
        }
    }
    
    func popRootVC() {
        
    }
    
}
