//
//  EnterPhonePresenter.swift
//  hammer
//
//  Created by Максим Половинкин on 24.04.2023.
//

import Foundation
import UIKit
import FirebaseAuth


protocol EnterPhoneViewProtocol: AnyObject {
    //Something
}

protocol EnterPhoneViewPresenterProtocol: AnyObject {
    init(view: EnterPhoneViewProtocol, router: RouterProtocol)
}

class EnterPhonePresenter: EnterPhoneViewPresenterProtocol {
    weak var view: EnterPhoneViewProtocol?
    var router: RouterProtocol?

    
    required init(view: EnterPhoneViewProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
    }
    
    func didTapButton(telephoneNumber: String?, view: UIViewController) {
        guard let telephoneNumber = telephoneNumber else  { return }
        PhoneAuthProvider.provider().verifyPhoneNumber(telephoneNumber, uiDelegate: nil) {[router] id, error in
            if error != nil {
                print(error?.localizedDescription)
            } else {
                router?.showEnterCodeVC(telephoneNumber: telephoneNumber, superView: view, id: id!)
            }
        }
    }
}
