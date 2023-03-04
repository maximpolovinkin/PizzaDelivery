//
//  PizzaViewController.swift
//  hammer
//
//  Created by Максим Половинкин on 11.01.2023.
//

import UIKit

class PizzaViewController: UIViewController {
    var pizzaDescription = UILabel(frame: CGRect(x: 15, y: 475, width: 360, height: 25))
    var presenter: DetailViewPresenterProtocol!

     //MARK:  - VC Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        presenter.setDetailInfo()
        
        view.backgroundColor = .white
    }
    
     //MARK: - UI Elements
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
        
        return doughChanger
    }()
    
    let pizzaImageView : UIImageView = {
        let pizzaImageView  = UIImageView(frame: CGRect(x: 15, y: 45, width: 360, height: 420))
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
        
        return sizeChanger
    }()
    
    let toTrashButton : UIButton = {
        let toTrashButton = UIButton(frame:CGRect(x: 15, y: 750, width: 360, height: 60))
    
        toTrashButton.backgroundColor = UIColor(named: "priceColor")
        toTrashButton.layer.cornerRadius = toTrashButton.bounds.height / 2
        toTrashButton.setTitle("В корзину за 345 р", for: .normal)
        toTrashButton.titleLabel?.font = .boldSystemFont(ofSize: 17)
        toTrashButton.titleLabel?.textColor = .white
        
        return toTrashButton
    }()
   
    @objc func moveToTrash() {
       
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
    }
}


 //MARK: - DetailViewProtocol
extension PizzaViewController: DetailViewProtocol {
    func setDetailInfo(menuItem: menuItems?, image: UIImage?) {
        guard let menuItem = menuItem, let image = image else { return }
        pizzaImageView.image = image
        pizzaDescription.font = .boldSystemFont(ofSize: 19)
        descriptionView.text = "Ветчина,шампиньоны, увеличинная порция моцареллы, томатный соус"
        
    }
}
