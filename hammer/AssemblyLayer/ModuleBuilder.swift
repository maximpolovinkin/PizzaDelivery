//
//  ModuleBuilder.swift
//  hammer
//
//  Created by Максим Половинкин on 27.02.2023.
//

import Foundation
import UIKit

protocol AssamblyBuilderProtocol {
     func createMenuModule(router: RouterProtocol) -> UIViewController
     func createDetailModule(menuItem: menuItems?) -> UIViewController
}

class ModuleBuilder: NSObject, AssamblyBuilderProtocol {
     func createDetailModule(menuItem: menuItems?) -> UIViewController {
        let view =  PizzaViewController()
        let networkService = NetworkService()
        let presenter = DetailPizzaPresenter(view: view, menuItem: menuItem, networkingService: networkService)
         
        view.presenter = presenter
        
        return view
    }
    
    func createMenuModule(router: RouterProtocol) -> UIViewController {
        let view =  MenuViewController()
        let networkService = NetworkService()
     
        let presenter = MainMenuPresenter(view: view, networkServise: networkService, router: router)
        
        view.presenter = presenter
        
        return view
    }
}
