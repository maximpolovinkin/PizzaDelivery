//
//  ModuleBuilder.swift
//  hammer
//
//  Created by Максим Половинкин on 27.02.2023.
//

import Foundation
import UIKit

protocol AssamblyBuilderProtocol {
     static func createMenuModule() -> UIViewController
     static func createDetailModule(menuItem: menuItems?, image: UIImage?) -> UIViewController
}

class ModuleBuilder: NSObject, AssamblyBuilderProtocol {
     static func createDetailModule(menuItem: menuItems?, image: UIImage?) -> UIViewController {
        let view =  PizzaViewController()
        let networkService = NetworkService()
        let presenter = DetailPizzaPresenter(view: view, menuItem: menuItem, networkingService: networkService, image: image)
         
        view.presenter = presenter
        
        return view
    }
    
    static func createMenuModule() -> UIViewController {
        let view =  MenuViewController()
        let networkService = NetworkService()
     
        let presenter = MainMenuPresenter(view: view, networkServise: networkService)
        
        view.presenter = presenter
        
        return view
    }
}
