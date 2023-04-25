//
//  EnterCodeViewController.swift
//  hammer
//
//  Created by Максим Половинкин on 23.04.2023.
//

import Foundation
import UIKit
import FlagPhoneNumber

class EnterCodeViewController: UIViewController {
    var presenter: EnterCodePresenter?
    var sec = 50
    var timer: Timer?
    
    
    //MARK: - VC lifecycle
    override func viewDidLoad() {
        setViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        codeTextView.endEditing(false)
        label.text = "Получить новый код через \(sec) сек"
        setTimer()
    }
    
    //MARK: - UI Elements
    private let button: UIButton = {
        let button = UIButton(frame:CGRect(x: 15, y: 750, width: 320, height: 60))
        button.backgroundColor = UIColor(named: "priceColor")
        button.layer.cornerRadius = button.bounds.height / 2
        button.setTitle("Получить новый код", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 17)
        button.titleLabel?.textColor = .white
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.alpha = 0.5
        button.isEnabled = false
        
        return button
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 50, y: 150, width: 100, height: 30)
        label.text = "Получить новый код через 50 сек"
        label.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        
        return label
    }()
    
    private let codeTextView: UITextView = {
        let text = UITextView()
        text.frame = CGRect(x: 0, y: 0, width: 0, height: 40)
        text.backgroundColor = .white
        text.layer.borderWidth = 1
        text.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0.7)
        text.font = .boldSystemFont(ofSize: 30)
        text.keyboardType = .phonePad
        text.layer.cornerRadius = 25
        text.isScrollEnabled = false
        text.textAlignment = .center
        
        
        return text
    }()
    
     //MARK: - Actions
    @objc func buttonPressed() {
        
    }
    
    @objc func timerFunc() {
        label.text = "Получить новый код через \(sec) сек"
        label.sizeToFit()
        
        if sec == 0 {
            button.alpha = 1
            button.isEnabled = true
            label.isHidden = true
        } else {
            sec -= 1
        }
    }
    
    func setTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1,
                                     target: self,
                                     selector: #selector(timerFunc),
                                     userInfo: nil,
                                     repeats:  true
        )
    }
    
    //MARK: - UI Settings
    func setViews() {
        self.navigationController?.navigationBar.tintColor = UIColor(named: "priceColor")
        self.view.backgroundColor = .white
        self.view.addSubview(button)
        self.view.addSubview(label)
        self.view.addSubview(codeTextView)
        
        label.sizeToFit()
        codeTextView.delegate = self
        setConstraints()
    }
    
    func setConstraints() {
        button.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        codeTextView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 35),
            button.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -35),
            button.heightAnchor.constraint(equalToConstant: 60),
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -360),
            
            label.heightAnchor.constraint(greaterThanOrEqualToConstant: 10),
            label.widthAnchor.constraint(greaterThanOrEqualToConstant: 10),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -5),
            
            codeTextView.heightAnchor.constraint(greaterThanOrEqualToConstant: 60),
            codeTextView.widthAnchor.constraint(equalTo: button.widthAnchor),
            codeTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            codeTextView.bottomAnchor.constraint(equalTo: label.topAnchor, constant: -20),
        ])
    }
}


extension EnterCodeViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let currentCharacterCount = textView.text?.count ?? 0
        
        if range.length + range.location > currentCharacterCount {
            return false
        }
        
        let newLenght = currentCharacterCount + text.count - range.length
        
        return newLenght <= 6
    }
    
    func textViewDidChange(_ textView: UITextView) {
        if textView.text.count == 6 {
            codeTextView.endEditing(true)
            presenter?.didTapButton(smsCode: textView.text)
            self.dismiss(animated: true)
        }
    }
}


extension EnterCodeViewController: EnterCodeViewProtocol {
    
}
