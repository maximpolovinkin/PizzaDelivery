//
//  ContactsPresenter.swift
//  hammer
//
//  Created by Максим Половинкин on 01.03.2023.
//

import Foundation
import UIKit

protocol ContactsViewProtocol: AnyObject {
    
}

protocol ContactsViewPresenterProtocol: AnyObject {
    func didTapURL()
    func didTapCall()
    func didTapChat()
    init(view: ContactsViewProtocol, router: RouterProtocol)
}

class ContactsPresenter: ContactsViewPresenterProtocol {
    var router: RouterProtocol?
    weak var view: ContactsViewProtocol!
    
    required init(view: ContactsViewProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
    }
    
    func didTapURL() {
        if let url = URL(string: "https://yandex.ru/maps/213/moscow/chain/dodo_picca/70891266502/?ll=37.644081%2C55.771667&sll=37.644081%2C55.771512&z=11"){
            UIApplication.shared.openURL(url)
        }
    }
    
    func didTapCall() {
        let url = URL(string: "telprompt://+79000000000")!
                
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.openURL(url)
        }
    }
    
    func didTapChat() {
        // Добавить метод ShowChat в router
    }
}
