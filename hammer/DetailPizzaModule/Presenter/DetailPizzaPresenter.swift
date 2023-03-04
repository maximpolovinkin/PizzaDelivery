//
//  DetailPizzaPresenter.swift
//  hammer
//
//  Created by Максим Половинкин on 01.03.2023.
//

import Foundation
import UIKit

protocol DetailViewProtocol: AnyObject {
    func setDetailInfo(menuItem: menuItems?, image: UIImage?)// можно добавить в параметры картинку - если есть в кеше - суем из кеша, иначе в запрос
}

protocol DetailViewPresenterProtocol {
    init(view: DetailViewProtocol, menuItem: menuItems?, networkingService: NetworkServiceProtocol, image: UIImage?)
    func setDetailInfo()// можно добавить в параметры картинку - если есть в кеше - суем из кеша, иначе в запрос
}

class DetailPizzaPresenter: DetailViewPresenterProtocol {
    weak var view: DetailViewProtocol!
    var menuItem: menuItems?
    var networkingService: NetworkServiceProtocol!
    var image: UIImage?
    
    required init(view: DetailViewProtocol, menuItem: menuItems?, networkingService: NetworkServiceProtocol, image: UIImage?) {
        self.view = view
        self.menuItem = menuItem
        self.networkingService = networkingService
        self.image = image
        
        setDetailInfo()
    }
    
    func setDetailInfo() {
        self.view.setDetailInfo(menuItem: menuItem, image: image)
    }
    
}
