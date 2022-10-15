//
//  ProfileViewController.swift
//  hammer
//
//  Created by Максим Половинкин on 13.10.2022.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    private var collectionView = bannersCollectionView()
    private var menuCollectionView = MenuCollectionView()
   
    var navBar = UINavigationBar(frame: CGRect(x: 0, y: 46, width: UIScreen.main.bounds.width, height: 40))
    
    private let table: UITableView = {
        let table = UITableView(frame: CGRect(x: 0, y: 329, width: 0, height: 570), style: .plain)
        table.register(mainTableTableViewCell.self, forCellReuseIdentifier: "cell")
        
        return table
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .init(named: "Color")
        title = "menu"
        view.addSubview(table)
        table.dataSource = self
        table.delegate = self
        view.addSubview(collectionView)
        view.addSubview(menuCollectionView)
        collectionView.contentInset.left = 5
        menuCollectionView.contentInset.left = 20
        setNavigationBar()
        navBar.barTintColor = .init(named: "Color")
        
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: navBar.bottomAnchor, constant: 40).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 142).isActive = true
        
        
        menuCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        menuCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        menuCollectionView.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 0).isActive = true
        menuCollectionView.heightAnchor.constraint(equalToConstant: 42).isActive = true
        
        
        tabBarController?.tabBar.bounds = CGRect(x: 0, y: 0, width: 375, height: 83)
        
        collectionView.sett(cells: banner.fetchBanners())
        menuCollectionView.sett(cells: menu.fetchBanners())
       
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
       //table.frame = view.bounds
        table.frame = CGRect(x: 0, y: 327, width: view.bounds.width, height: 570)
        
        table.rowHeight = 196
        tabBarItem = UITabBarItem(title: "Меню", image: UIImage(named: "menu"), tag: 0)
    }
    
    func setNavigationBar() {
        
        let navItem = UINavigationItem(title: "")
       
        let doneItem = UIBarButtonItem(title: "Москва v", style: UIBarButtonItem.Style.plain, target: nil, action: #selector(chooseCity))
        doneItem.tintColor = .black
        
  
        navItem.leftBarButtonItem = doneItem
        navBar.setItems([navItem], animated: false)
        
        navBar.backgroundColor = .init(named: "Color")
       
        
        self.view.addSubview(navBar)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! mainTableTableViewCell
        
        
        cell.imageView?.image = UIImage(named: "pizza1")
        cell.textField.text = "Баварские колбаски"
        cell.descriptionTextField.text = "Ветчина,шампиньоны, увеличинная порция моцареллы, томатный соус"
        
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        return cell
    }
    
    

    @objc func chooseCity() {
    }
}
