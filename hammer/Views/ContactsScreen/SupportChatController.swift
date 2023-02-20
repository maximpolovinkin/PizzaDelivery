//
//  SupportChatController.swift
//  hammer
//
//  Created by Максим Половинкин on 11.01.2023.
//

import Foundation
import UIKit

class SupportChatController : UIViewController {

    override func viewWillLayoutSubviews() {
        let width = self.view.frame.width
        let navigationBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: width, height: 44))
        self.view.addSubview(navigationBar);
        let navigationItem = UINavigationItem(title: "Чат")
        let doneBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.close, target: nil, action: #selector(close))
        navigationItem.leftBarButtonItem = doneBtn
        navigationBar.setItems([navigationItem], animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
    }
    
    @objc func close() {
        self.dismiss(animated: true, completion: nil)
    }
}
