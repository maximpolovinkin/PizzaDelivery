//
//  PizzaViewController.swift
//  hammer
//
//  Created by Максим Половинкин on 11.01.2023.
//

import UIKit
import AudioToolbox

class PizzaViewController: UIViewController {
    var presenter: DetailViewPresenterProtocol!
    var delegate: SenderDelegate?
   
    private var pizzaId = 0
   
     //MARK:  - VC Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        presenter.setDetailInfo()
        view.backgroundColor = .white
    }
    
     //MARK: - UI Elements
    var pizzaDescription = UILabel(frame: CGRect(x: 15, y: 475, width: 360, height: 25))
    
    let closeBtn : UIButton = {
        let closeBtn = UIButton(type: .close)
        closeBtn.frame = CGRect(x: 15, y: 45, width: 45, height: 45)
        closeBtn.layer.cornerRadius = closeBtn.bounds.height / 2
        closeBtn.backgroundColor = .white
        
        return closeBtn
    }()
    
    let doughChanger : UISegmentedControl = {
        let doughChanger = UISegmentedControl(items: ["Традиционное", "Тонкое"])
        doughChanger.frame = CGRect(x: 15, y: 695, width: 360, height: 40)
        doughChanger.selectedSegmentIndex = 0
        doughChanger.translatesAutoresizingMaskIntoConstraints = false
        
        return doughChanger
    }()
    
    let pizzaImageView : UIImageView = {
        let pizzaImageView  = UIImageView(frame: CGRect(x: 15, y: 45, width: 360, height: 360))
        pizzaImageView.backgroundColor = .red
        
        return pizzaImageView
    }()
    
    let descriptionView : UITextView = {
        let description = UITextView(frame: CGRect(x: 10, y: 495, width: 360, height: 135))
        description.translatesAutoresizingMaskIntoConstraints = false
        description.font = .systemFont(ofSize: 15)
        
        return description
    }()
    
    let sizeChanger : UISegmentedControl = {
        let sizeChanger = UISegmentedControl(items: ["Маленькая", "Средняя", "Большая"])
        sizeChanger.frame = CGRect(x: 15, y: 650, width: 360, height: 40)
        sizeChanger.selectedSegmentIndex = 1
        sizeChanger.translatesAutoresizingMaskIntoConstraints = false
      
        return sizeChanger
    }()
    
    let toTrashButton : UIButton = {
        let toTrashButton = UIButton(frame:CGRect(x: 15, y: 750, width: 360, height: 60))
    
        toTrashButton.backgroundColor = UIColor(named: "priceColor")
        toTrashButton.layer.cornerRadius = toTrashButton.bounds.height / 2
        toTrashButton.setTitle("В корзину за 345 ₽", for: .normal)
        toTrashButton.titleLabel?.font = .boldSystemFont(ofSize: 17)
        toTrashButton.titleLabel?.textColor = .white
        
        return toTrashButton
    }()
   
    //MARK:  - Actions
    @objc func moveToTrash() {
        Cart.shareInstance().setItem(item: menuItems(id: pizzaId, title: pizzaDescription.text ?? "", image: "SDf"))
        Cart.shareInstance().setImages(image: pizzaImageView.image!)
        Cart.shareInstance().addPrice(price: 345)
        
        let notificationFeedbackGenerator = UINotificationFeedbackGenerator()
        notificationFeedbackGenerator.prepare()
        notificationFeedbackGenerator.notificationOccurred(.success)
        
        self.dismiss(animated: true)
    }
    
    @objc func sizeChangerTapped() {
        let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .light)
        impactFeedbackgenerator.prepare()
        impactFeedbackgenerator.impactOccurred()
    }
    
     //MARK: - Helpers
    func setActions(){ // was added cuz caught unrecognized selector sent to class
        closeBtn.addTarget(self, action: #selector(close), for: .touchUpInside)
        toTrashButton.addTarget(self, action: #selector(moveToTrash), for: .touchUpInside)
    }
    
    @objc func close() {
        self.dismiss(animated: true, completion: nil)
    }

    func setUpViews() {
        view.addSubview(doughChanger)
        view.addSubview(sizeChanger)
        view.addSubview(toTrashButton)
        view.addSubview(pizzaImageView)
        view.addSubview(closeBtn)
        view.addSubview(descriptionView)
        view.addSubview(pizzaDescription)
        setActions()
        setConstraints()
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            doughChanger.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            doughChanger.heightAnchor.constraint(equalToConstant: 50),
            doughChanger.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            doughChanger.topAnchor.constraint(equalTo: view.topAnchor, constant: 685),
            
            sizeChanger.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            sizeChanger.heightAnchor.constraint(equalToConstant: 50),
            sizeChanger.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            sizeChanger.topAnchor.constraint(equalTo: view.topAnchor, constant: 630)
        ])
    }
}

 //MARK: - DetailViewProtocol
extension PizzaViewController: DetailViewProtocol {
    func setDetailInfo(menuItem: menuItems?, image: UIImage?) {
        guard let menuItem = menuItem, let image = image else { return }
        pizzaId = menuItem.id
        pizzaImageView.image = image
        pizzaDescription.font = .boldSystemFont(ofSize: 19)
        pizzaDescription.text = menuItem.title
        descriptionView.text = "В основе увеличенная порция моцареллы, любимая ветчина прошутто, ароматные шампиньоны и привычный томатный соус. Сочетание вкусов не оставит равнодушным"
        
        
    }
}
