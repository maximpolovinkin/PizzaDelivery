//
//  TrashViewController.swift
//  hammer
//
//  Created by Максим Половинкин on 13.10.2022.
//

import UIKit

protocol TrashViewControllerrDelegate: AnyObject {
    func fillTheTableWith(pizzaImg: String, pizzaDescription: String)
}

class TrashViewController: UIViewController {
   
    
    private var pizza = PizzaViewController()
    var a = 0
    var items = [menuItems]()
    
//    func fillTheTableWith(pizzaImg: String, pizzaDescription: String) {
//        print(pizzaDescription)
//        items.append((menuItems(title: "@34234234", image: "23234234")))
//        self.table.reloadData()
//    }
    
     private var table: UITableView = {
        let table = UITableView(frame: CGRect(x: 0, y: 329, width: 150, height: 570), style: .plain)
        table.register(mainTableTableViewCell.self, forCellReuseIdentifier: "cell")
        
        return table
    }()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(items)
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! mainTableTableViewCell
//        var url = URL(string: "sdf")
//
//        DispatchQueue.global().async {
//            url = URL(string: self.items[indexPath.row].image)
//        }
//        DispatchQueue.main.async {
//            if let data = try? Data(contentsOf: url!)
//            {
//                cell.img.image = UIImage(data: data)
//            }
//        }
//
//        cell.textField.text =  self.items[indexPath.row].title
//        cell.descriptionTextField.text = "Ветчина,шампиньоны, увеличинная порция моцареллы, томатный соус"
//
//        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(table)
        table.dataSource = self
        table.delegate = self
        
        pizza.trashDelegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tabBarItem = UITabBarItem(title: "Корзина", image: UIImage(named: "trash"), tag: 0)
        
        table.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        table.rowHeight = 196
        table.backgroundColor = .red
        table.reloadData()
    }
}

extension TrashViewController: UITableViewDataSource, UITableViewDelegate, TrashViewControllerrDelegate {
    func fillTheTableWith(pizzaImg: String, pizzaDescription: String) {
        print(pizzaDescription)
        items.append((menuItems(title: "@34234234", image: "23234234")))
        table.reloadData()
    }
}
