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
    func createDetailModule(menuItem: menuItems?, image: UIImage?) -> UIViewController
    func createContacntsModule(router: RouterProtocol) -> UIViewController
    func createProfileModule(router: RouterProtocol) -> UIViewController
    func createTrashModule(router: RouterProtocol) -> UIViewController
}

class ModuleBuilder: NSObject, AssamblyBuilderProtocol {
    
     //MARK: Detail pizza module
    func createDetailModule(menuItem: menuItems?, image: UIImage?) -> UIViewController {
        let view =  PizzaViewController()
        let networkService = NetworkService()
        let presenter = DetailPizzaPresenter(view: view, menuItem: menuItem, networkingService: networkService, image: image)
        
        view.presenter = presenter
        
        return view
    }
    
    //MARK: Main menu module
    func createMenuModule(router: RouterProtocol) -> UIViewController {
        let view =  MenuViewController()
        let networkService = NetworkService()
        let presenter = MainMenuPresenter(view: view, networkServise: networkService, router: router)
        
        view.presenter = presenter
        
        return view
    }
    //MARK: Contacts module
    func createContacntsModule(router: RouterProtocol) -> UIViewController {
        let view =  ContactsViewController()
        let presenter = ContactsPresenter(view: view, router: router)
        
        view.presenter = presenter
        
        return view
    }
    
    //MARK: Profile module
    func createProfileModule(router: RouterProtocol) -> UIViewController {
        let view =  ProfileViewController()
        let presenter = ProfilePresenter(view: view, router: router)
        
        view.presenter = presenter
        
        return view
    }
    
    //MARK: Trash module
    func createTrashModule(router: RouterProtocol) -> UIViewController {
        let view =  TrashViewController()
        let presenter = TrashViewPresenter(view: view, router: router)
        
        view.presenter = presenter
     
        return view
    }
}
