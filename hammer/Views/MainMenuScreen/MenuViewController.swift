//
//  ProfileViewController.swift
//  hammer
//
//  Created by Максим Половинкин on 13.10.2022.
//

import UIKit

var table: UITableView = {
    let table = UITableView(frame: CGRect(x: 0, y: 329, width: 0, height: 570), style: .plain)
    table.register(mainTableTableViewCell.self, forCellReuseIdentifier: "cell")
    
    return table
}()

class MenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, presentorDelegate {
    
    private var collectionView = bannersCollectionView()
    private var menuCollectionView = MenuCollectionView()
    private let citiController = CitiesViewController()
    let pizza = PizzaViewController()
    
    var navBar = UINavigationBar(frame: CGRect(x: 0, y: 46, width: UIScreen.main.bounds.width, height: 40))
    
    let presenter = presentor()
    var data = [menuItems]()
    var pizzaImages = [UIImage?]()
    
    //MARK: - VC lifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataWork()
        setViews()
        setConstraints()
        setAppearence()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        table.frame = CGRect(x: 0, y: 327, width: view.bounds.width, height: 570)
        table.rowHeight = 196
        tabBarItem = UITabBarItem(title: "Меню", image: UIImage(named: "menu"), tag: 0)
    }
    
    //MARK: - Table View
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! mainTableTableViewCell
        cell.img.image = pizzaImages[indexPath.row]
        cell.textField.text = data[indexPath.row].title
        cell.descriptionTextField.text = "Ветчина,шампиньоны, увеличинная порция моцареллы, томатный соус"
        
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let pizzaImg = pizzaImages[indexPath.row] {
            self.pizza.pizzaImg = pizzaImg
        }
        
        openPizzaSheet()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    //MARK: - Helpers
    @objc func chooseCity() {
        present(citiController, animated: true)
    }
    
    func openPizzaSheet() {
        pizza.modalPresentationStyle = .fullScreen
        present(pizza, animated: true)
        
    }
    
    //MARK: - UI Settings
    func setNavigationBar() {
        let navItem = UINavigationItem(title: "")
        let doneItem = UIBarButtonItem(title: "Москва v", style: UIBarButtonItem.Style.plain, target: self, action: #selector(chooseCity))
        doneItem.tintColor = .black
        navItem.leftBarButtonItem = doneItem
        navBar.setItems([navItem], animated: false)
        navBar.backgroundColor = .init(named: "Color")
        self.view.addSubview(navBar)
    }
    
    func setViews() {
        setNavigationBar()
        view.addSubview(table)
        view.addSubview(collectionView)
        view.addSubview(menuCollectionView)
    }
    
    func setConstraints() {
        collectionView.contentInset.left = 5
        menuCollectionView.contentInset.left = 20
        
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: navBar.bottomAnchor, constant: 40).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 142).isActive = true
        
        
        menuCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        menuCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        menuCollectionView.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 10).isActive = true
        menuCollectionView.heightAnchor.constraint(equalToConstant: 42).isActive = true
    }
    
    //MARK: - To remove to other files
    func setAppearence() {
        view.backgroundColor = .init(named: "Color")
        title = "menu"
        navBar.barTintColor = .init(named: "Color")
        tabBarController?.tabBar.bounds = CGRect(x: 0, y: 0, width: 375, height: 83)
    }
    
    func loadImages(data: [menuItems]) {
        for item in data {
            guard let url = URL(string: item.image) else { return  }
            if let data = try? Data(contentsOf: url)
            {
                pizzaImages.append(UIImage(data: data))
            }
        }
    }
    
    func presentData(data: [menuItems]) {
        self.data = data
        loadImages(data: data)
        DispatchQueue.main.async {
            table.reloadData()
        }
    }
    
    func dataWork() {
        table.dataSource = self
        table.delegate = self
        
        presenter.setViewDelegate(delegate: self)
        presenter.getData()
        
        collectionView.sett(cells: banner.fetchBanners())
        menuCollectionView.sett(cells: menu.fetchBanners())
    }
    
}

