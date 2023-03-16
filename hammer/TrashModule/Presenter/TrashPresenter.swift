//
//  TrashPresenter.swift
//  hammer
//
//  Created by Максим Половинкин on 01.03.2023.
//

import Foundation
import UIKit

protocol TrashViewProtocol: AnyObject {
    func setTable()
}

protocol TrashViewPresenterProtocol: AnyObject {
    init(view: TrashViewProtocol, router: RouterProtocol)
    func updateTrash(menuItem: menuItems?, image: UIImage?)
    var items: [menuItems]? {get set}
    var images: [UIImage]? {get set}
}

class TrashViewPresenter: TrashViewPresenterProtocol {
    var items: [menuItems]?
    var images: [UIImage]?
    
    weak var view: TrashViewProtocol?
    var router: RouterProtocol?
    
    required init(view: TrashViewProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
    }
    
    func updateTrash(menuItem: menuItems?, image: UIImage?) {
        guard let menuItem = menuItem, let image = image else { return }
        if self.items == nil {
            self.items = [menuItem]
        } else {
            self.items?.append(menuItem)
        }
        
        if self.images == nil {
            self.images = [image]
        } else {
            self.images?.append(image)
        }
       
        self.view?.setTable()
    }
}
