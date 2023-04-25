//
//  TrashViewController.swift
//  hammer
//
//  Created by Максим Половинкин on 13.10.2022.
//

import UIKit

class TrashViewController: UIViewController {

    var presenter: TrashViewPresenterProtocol!
    private var pizzaPresenter: DetailViewPresenterProtocol!
    private var viewXCenter: CGFloat = 0.0
    private var itemsCount = 0
   
    //MARK: - VC Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if Cart.shareInstance().getUniqueItemsCount() > 0 {
            self.catImage.isHidden = true
            self.cartEmotyLabel.isHidden = true
            self.table.isHidden = false
            self.doOrderView.isHidden = false
        } else {
            self.catImage.isHidden = false
            self.cartEmotyLabel.isHidden = false
            self.table.isHidden = true
            self.doOrderView.isHidden = true
        }
        
        table.reloadData()
        updateViews()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        viewXCenter = view.bounds.width / 2
        catImage.frame = CGRect(x: (viewXCenter - catImage.bounds.width / 2) , y: 200, width: 200, height: 200)
        cartEmotyLabel.frame = CGRect(x: (viewXCenter - cartEmotyLabel.bounds.width / 2), y: 500, width: 50, height: 200)
        cartEmotyLabel.sizeToFit()
    }
    
     //MARK: - UI Elements
     var table: UITableView = {
         let table = UITableView(frame: CGRect(x: 0, y: 400, width: 150, height: 570), style: .grouped)
        table.register(TrashTableViewCell.self, forCellReuseIdentifier: "cell")
        table.isHidden = true
         
        return table
    }()
    
    var catImage: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 100 , y: 200, width: 200, height: 200))
        image.image = UIImage(named: "catImg")
       
        return image
    }()
    
    var cartEmotyLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 100, y: 500, width: 50, height: 200))
        label.font = .boldSystemFont(ofSize: 28)
        label.text = "Упс! Корзина пуста"
        label.sizeToFit()
        
        return label
    }()
    
    var doOrderView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.isHidden = true
        
        return view
    }()
    
    let doOrderButton : UIButton = {
        let doOrderButton = UIButton(frame:CGRect(x: 0, y: 0, width: 360, height: 50))
        doOrderButton.backgroundColor = UIColor(named: "priceColor")
        doOrderButton.layer.cornerRadius = doOrderButton.bounds.height / 2
        doOrderButton.setTitle("В корзину за 345 ₽", for: .normal)
        doOrderButton.titleLabel?.font = .boldSystemFont(ofSize: 17)
        doOrderButton.titleLabel?.textColor = .white
        
        return doOrderButton
    }()
    
    var totalLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 100, y: 500, width: 50, height: 200))
        label.font = .boldSystemFont(ofSize: 25)
       
        return label
    }()
    
    //MARK: - Helpers
    func setUpTable() {
        view.addSubview(table)
        table.dataSource = self
        table.delegate = self
        table.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        table.rowHeight = 120
        table.allowsSelection = false
        table.sectionFooterHeight = 4
        table.sectionHeaderHeight = 2
        table.backgroundColor = .systemGroupedBackground

        totalLabel.text = " 1 товар на 345 ₽"
        totalLabel.sizeToFit()
        table.tableHeaderView = totalLabel
        table.tableHeaderView?.isHidden = false
    }
    
    func setViews() {
        setUpTable()
        view.backgroundColor = .white
        view.addSubview(catImage)
        view.addSubview(cartEmotyLabel)
        
        doOrderView.frame = CGRect(x: 0, y: 100, width: self.view.bounds.width, height: 70)
        doOrderView.addSubview(doOrderButton)
        view.addSubview(doOrderView)
        tabBarItem = UITabBarItem(title: "Корзина", image: UIImage(named: "trash"), tag: 0)
        setConstraints()
    }
    
    func updateViews() {
        doOrderButton.setTitle("Оформить заказ на \(Cart.shareInstance().getAllItemsCount() * 345) ₽", for: .normal)
        totalLabel.text = " \(Cart.shareInstance().getAllItemsCount()) товаров на \(Cart.shareInstance().getAllItemsCount() * 345) ₽"
        totalLabel.sizeToFit()
        if Cart.shareInstance().getUniqueItemsCount() > 0 {
            self.catImage.isHidden = true
            self.cartEmotyLabel.isHidden = true
            self.table.isHidden = false
            self.doOrderView.isHidden = false
            table.reloadData()
        } else {
            self.catImage.isHidden = false
            self.cartEmotyLabel.isHidden = false
            self.table.isHidden = true
            self.doOrderView.isHidden = true
        }
    }
    
    func setConstraints(){
        doOrderView.translatesAutoresizingMaskIntoConstraints = false
        doOrderButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            doOrderView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            doOrderView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            doOrderView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: self.view.bounds.height - doOrderView.bounds.height  - (self.tabBarController?.tabBar.bounds.height)!),
            doOrderView.heightAnchor.constraint(equalToConstant: 70),
            
            doOrderButton.leftAnchor.constraint(equalTo: doOrderView.leftAnchor, constant: 10),
            doOrderButton.rightAnchor.constraint(equalTo: doOrderView.rightAnchor, constant: -10),
            doOrderButton.topAnchor.constraint(equalTo: doOrderView.topAnchor, constant: 10),
            doOrderButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

//MARK: - Table View
extension TrashViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
         Cart.shareInstance().getUniqueItemsCount()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TrashTableViewCell
        let item = Cart.shareInstance().getItem(forId: indexPath.section)
        let image = Cart.shareInstance().getImage(forIndex: indexPath.section)
        let price = Cart.shareInstance().prices[indexPath.section]
        
        if let menuItem = item.item, let count = item.repeating,
           let image = image {
            cell.configure(steppetValue: count, pizzaName: menuItem.title, image: image, currentId: menuItem.id, pizzaParamentes: "Средняя 30 см, традиционное тесто", delegate: self, tag: indexPath.section, price: price)
        }
        cell.contentView.isUserInteractionEnabled = false
        table.reloadRows(at: [indexPath], with: .none)
        
        return cell
    }
}

//MARK: - TrashViewProtocol
extension TrashViewController: TrashViewProtocol {
    func setTable() {
        
    }
}

//MARK: CustomCellDelegate
extension TrashViewController: CustomCellDelegate {
    func didPressStepper(for cell: UITableViewCell) {
        self.updateViews()
    }
}
