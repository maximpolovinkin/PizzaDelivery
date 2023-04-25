//
//  EnterCodePresenter.swift
//  hammer
//
//  Created by Максим Половинкин on 24.04.2023.
//

import Foundation
import FirebaseAuth


protocol EnterCodeViewProtocol: AnyObject {
    ///
}

protocol EnterCodeViewPresenterProtocol: AnyObject {
    init(view: EnterCodeViewProtocol, router: RouterProtocol, id: String)
}

class EnterCodePresenter: EnterCodeViewPresenterProtocol {
    weak var view: EnterCodeViewProtocol?
    var router: RouterProtocol?
    var id: String?
    
    required init(view: EnterCodeViewProtocol, router: RouterProtocol, id: String) {
        self.view = view
        self.router = router
        self.id = id
    }
    
    func didTapButton(smsCode: String?, view: EnterCodeViewController) {
        guard let id = id, let code = smsCode else { return }
        
        let credetional = PhoneAuthProvider.provider().credential(withVerificationID: id, verificationCode: code)
        Auth.auth().signIn(with: credetional) {[router] _, error in
            if error != nil {
                print(error?.localizedDescription)
                view.codeTextView.layer.borderColor = CGColor.init(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                router?.autorise()
            }
        }
    }
}
