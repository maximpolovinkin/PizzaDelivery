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
}

class ModuleBuilder: NSObject {
    static func createMenuModule() -> UIViewController {
        let view =  MenuViewController()
        let networkService = NetworkService()
        let presenter = MainMenuPresenter(view: view, networkServise: networkService)
         
        view.presenter = presenter
        
        return view
    }
}
