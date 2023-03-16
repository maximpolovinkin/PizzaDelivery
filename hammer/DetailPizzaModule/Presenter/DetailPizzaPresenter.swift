//
//  DetailPizzaPresenter.swift
//  hammer
//
//  Created by Максим Половинкин on 01.03.2023.
//

import Foundation
import UIKit

protocol DetailViewProtocol: AnyObject {
    func setDetailInfo(menuItem: menuItems?, image: UIImage?)
}

protocol DetailViewPresenterProtocol {
    init(view: DetailViewProtocol, menuItem: menuItems?, networkingService: NetworkServiceProtocol, image: UIImage?)
    func setDetailInfo()
    func didTapAdd(menuItem: menuItems?, image: UIImage?)
  
}

protocol SenderDelegate {
    func sedData(menuItem: menuItems?, image: UIImage?)
}

class DetailPizzaPresenter: DetailViewPresenterProtocol{
  
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
    
    func didTapAdd(menuItem: menuItems?, image: UIImage?) {
       
    }
    
}
