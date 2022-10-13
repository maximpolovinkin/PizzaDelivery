//
//  ProfileViewController.swift
//  hammer
//
//  Created by Максим Половинкин on 13.10.2022.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private let table: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        return table
    }()
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "menu"
        view.addSubview(table)
        table.dataSource = self
        table.delegate = self
        tabBarItem = UITabBarItem(title: "Меню", image: UIImage(named: "menu"), tag: 0)
        
        
        setNavigationBar()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
       //table.frame = view.bounds
        table.frame = CGRect(x: 0, y: 366, width: view.bounds.width, height: 530)
        table.rowHeight = 156
       
    }
    
    func setNavigationBar() {
        let screenSize: CGRect = UIScreen.main.bounds
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 46, width: screenSize.width, height: 320))
        let navItem = UINavigationItem(title: "")
       
        let doneItem = UIBarButtonItem(title: "Москва v", style: UIBarButtonItem.Style.plain, target: nil, action: #selector(chooseCity))
        doneItem.tintColor = .black
  
        navItem.leftBarButtonItem = doneItem
        navBar.setItems([navItem], animated: false)
        
        navBar.backgroundColor = .white
        
        self.view.addSubview(navBar)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.bounds = CGRect(x: 0, y: 0, width: 375, height: 200)
        cell.backgroundColor = .white
        return cell
    }

    @objc func chooseCity() {
    }
}
