//
//  MainMenuPresenter.swift
//  hammer
//
//  Created by Максим Половинкин on 27.02.2023.
//

import Foundation
import UIKit

protocol MenuViewProtocol: AnyObject {
    func success()
    func failure(error: Error)
}

protocol MenuViewPresenterProtocol: AnyObject {
    init(view: MenuViewProtocol, networkServise: NetworkServiceProtocol, router: RouterProtocol)
    func getMenu()
    func loadImages(items: [menuItems]?)
    var menuItems: [menuItems]? {get set}
    var images: [UIImage]? {get set}
}

class MainMenuPresenter: MenuViewPresenterProtocol {
    
    
    var networkServise: NetworkServiceProtocol!
    weak var view: MenuViewProtocol?
    var menuItems: [menuItems]?
    var images: [UIImage]?
    var router: RouterProtocol?
    
    required init(view: MenuViewProtocol, networkServise: NetworkServiceProtocol, router: RouterProtocol) {
        self.view = view
        self.networkServise = networkServise
        self.router = router
        
        getMenu()
        //loadImages(items: menuItems)
    }
    
    func getMenu() {
        networkServise.getData {[weak self] result in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    self.menuItems = data
                    self.loadImages(items: data)
                    self.view?.success()
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
        }
    }
    
    func loadImages(items: [menuItems]?) {
        DispatchQueue.global().async {
            if let items = items {
                for item in items {
                    guard let url = URL(string: item.image) else { return  }
                    if let data = try? Data(contentsOf: url)
                    {
                        let image = UIImage(data: data)
                        DispatchQueue.main.async {
                            if self.images != nil{
                                self.images! += [image!]
                            } else {
                                self.images = [image!]
                            }
                        }
                    }
                }
            }
        }
    }
}
