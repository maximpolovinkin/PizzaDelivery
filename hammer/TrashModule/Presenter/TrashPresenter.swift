//
//  TrashPresenter.swift
//  hammer
//
//  Created by Максим Половинкин on 01.03.2023.
//

import Foundation

protocol TrashViewProtocol: AnyObject {
    
}

protocol TrashViewPresenterProtocol: AnyObject {
    init(view: TrashViewProtocol, router: RouterProtocol)
}

class TrashViewPresenter: TrashViewPresenterProtocol {
    weak var view: TrashViewProtocol?
    var router: RouterProtocol?
    
    required init(view: TrashViewProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
    }
}
