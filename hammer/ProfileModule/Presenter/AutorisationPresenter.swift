//
//  AutorisationPresenter.swift
//  hammer
//
//  Created by Максим Половинкин on 22.04.2023.
//

import Foundation


protocol AutorisationViewProtocol: AnyObject {
    //Something
}

protocol AutorisationViewPresenterProtocol: AnyObject {
    init(view: AutorisationViewProtocol, router: RouterProtocol)
}

class AutorisationPresenter: AutorisationViewPresenterProtocol {
    weak var view: AutorisationViewProtocol?
    var router: RouterProtocol?
    
    required init(view: AutorisationViewProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
    }
    
    func didTapButton() {
        router?.showEnterPhoneVC()
    }
}
