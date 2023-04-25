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
    func getImage(forKey: Int, completion: @escaping ((UIImage?) -> Void))
    func getTitle(forKey index: Int, completion: @escaping ((String?) -> Void))
    var menuItems: [menuItems]? {get set}
    var images: [UIImage]? {get set}
    func didTapCell(menuItem: menuItems?, image: UIImage?)
  
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
    }
    
     //MARK: Get menu data from API
    func getMenu() {
        networkServise.getData {[weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async { [self] in
                switch result {
                case .success(let data):
                    self.menuItems = data
                    self.view?.success()
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
        }
    }
    
    //MARK: Get images from cache if they are there otherwise loading from url and save
    func getImage(forKey index: Int, completion: @escaping ((UIImage?) -> Void)) {
        if let menuItems = self.menuItems {
            if let image = networkServise.cachedImages?.object(forKey: "\(menuItems[index].image)" as NSString) {
                completion(image)
            } else {
                networkServise.loadImage(key: "\(menuItems[index].image)") { image in
                    DispatchQueue.main.async {
                        completion(image)
                    }
                }
            }
        }
    }
    
    //MARK: Get titles from cache if they are there otherwise loading from url and save
    func getTitle(forKey index: Int, completion: @escaping ((String?) -> Void)) {
        if let menuItems = self.menuItems {
            if let title = networkServise.cachedTitles?.object(forKey: "\(menuItems[index].title)" as NSString) {
                completion(title as String)
            } else {
                networkServise.loadTitle(key: "\(menuItems[index].title)", object: menuItems[index].title) { title in
                    if let title = title {
                        DispatchQueue.main.async {
                            completion(title)
                        }
                    }
                }
            }
        }
    }
    
    //MARK: Action for menu cell tap
    func didTapCell(menuItem: menuItems?, image: UIImage?) {
        router?.showDetail(menuItem: menuItem, image: image)
    }
}
