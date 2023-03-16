//
//  TrashViewController.swift
//  hammer
//
//  Created by Максим Половинкин on 13.10.2022.
//

import UIKit

class TrashViewController: UIViewController {
    
    private var pizza = PizzaViewController()
    var presenter: TrashViewPresenterProtocol!
    var pizzaPresenter: DetailViewPresenterProtocol!
    var viewXCenter: CGFloat = 0.0
   
    //MARK: - VC Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
      
        setViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if Cart.shareInstance().getItems().count > 0 {
            self.catImage.isHidden = true
            self.cartEmotyLabel.isHidden = true
        }
        table.reloadData()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        viewXCenter = view.bounds.width / 2
        catImage.frame = CGRect(x: (viewXCenter - catImage.bounds.width / 2) , y: 200, width: 200, height: 200)
        cartEmotyLabel.frame = CGRect(x: (viewXCenter - cartEmotyLabel.bounds.width / 2), y: 500, width: 50, height: 200)
        cartEmotyLabel.sizeToFit()
    }
    
    //MARK: - UI Settings
     var table: UITableView = {
         let table = UITableView(frame: CGRect(x: 0, y: 400, width: 150, height: 570), style: .plain)
        table.register(mainTableTableViewCell.self, forCellReuseIdentifier: "cell")
        
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

    func setUpTable() {
        view.addSubview(table)
        table.dataSource = self
        table.delegate = self
        table.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        table.rowHeight = 196
        table.allowsSelection = false
    }
    
    func setViews() {
        setUpTable()
        view.backgroundColor = .white
        view.addSubview(catImage)
        view.addSubview(cartEmotyLabel)
        
        tabBarItem = UITabBarItem(title: "Корзина", image: UIImage(named: "trash"), tag: 0)
    }
}

//MARK: - Table View
extension TrashViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return Cart.shareInstance().getItems().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! mainTableTableViewCell
        cell.img.image = Cart.shareInstance().getImages()[indexPath.row]
        cell.descriptionTextField.text = Cart.shareInstance().getItems()[indexPath.row].title
        table.reloadRows(at: [indexPath], with: .none)
        
        return cell
    }
}

extension TrashViewController: TrashViewProtocol {
    func setTable() {
        
    }
}
