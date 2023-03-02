//
//  DetailPizzaPresenter.swift
//  hammer
//
//  Created by Максим Половинкин on 01.03.2023.
//

import Foundation

protocol DetailViewProtocol: AnyObject {
    func setDetailInfo(menuItem: menuItems?)// можно добавить в параметры картинку - если есть в кеше - суем из кеша, иначе в запрос
}

protocol DetailViewPresenterProtocol {
    init(view: DetailViewProtocol, menuItem: menuItems?, networkingService: NetworkServiceProtocol)
    func setDetailInfo(menuItem: menuItems?)// можно добавить в параметры картинку - если есть в кеше - суем из кеша, иначе в запрос
}

class DetailPizzaPresenter: DetailViewPresenterProtocol {
    weak var view: DetailViewProtocol!
    var menuItem: menuItems?
    var networkingService: NetworkServiceProtocol!
    
    required init(view: DetailViewProtocol, menuItem: menuItems?, networkingService: NetworkServiceProtocol) {
        self.view = view
        self.menuItem = menuItem
        self.networkingService = networkingService
        
        setDetailInfo(menuItem: self.menuItem)
    }
    
    func setDetailInfo(menuItem: menuItems?) {
        self.view.setDetailInfo(menuItem: menuItem)
    }
    
}
