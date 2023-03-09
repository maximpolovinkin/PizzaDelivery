//
//  ProfilePresenter.swift
//  hammer
//
//  Created by Максим Половинкин on 01.03.2023.
//

import Foundation

// Module is not done at all

protocol ProfileViewProtocol: AnyObject {
    //Something
}

protocol ProfileViewPresenterProtocol: AnyObject {
    init(view: ProfileViewProtocol, router: RouterProtocol)
}

class ProfilePresenter: ProfileViewPresenterProtocol {
    weak var view: ProfileViewProtocol?
    var router: RouterProtocol?
    
    required init(view: ProfileViewProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
    }
}
