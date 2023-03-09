//
//  TrashViewController.swift
//  hammer
//
//  Created by Максим Половинкин on 13.10.2022.
//

import UIKit

class TrashViewController: UIViewController, TrashViewProtocol {
    
    private var pizza = PizzaViewController()
    var presenter: TrashViewPresenter?

    
    //MARK: - VC Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpTable()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tabBarItem = UITabBarItem(title: "Корзина", image: UIImage(named: "trash"), tag: 0)
    }
    
    
    //MARK: - UI Settings
    private var table: UITableView = {
        let table = UITableView(frame: CGRect(x: 0, y: 329, width: 150, height: 570), style: .plain)
        table.register(mainTableTableViewCell.self, forCellReuseIdentifier: "cell")
        
        return table
    }()
    
    func setUpTable() {
        view.addSubview(table)
        table.dataSource = self
        table.delegate = self
        table.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        table.rowHeight = 196
        table.backgroundColor = .red
    }
}

//MARK: - Table View
extension TrashViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! mainTableTableViewCell
        return cell
    }
}
