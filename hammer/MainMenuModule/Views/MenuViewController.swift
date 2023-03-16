//
//  ProfileViewController.swift
//  hammer
//
//  Created by Максим Половинкин on 13.10.2022.
//

import UIKit

//Some global shit. Ofc not final version
var table: UITableView = {
    let table = UITableView(frame: CGRect(x: 0, y: 329, width: 0, height: 570), style: .plain)
    table.register(mainTableTableViewCell.self, forCellReuseIdentifier: "cell")

    return table
}()

class MenuViewController: UIViewController {
    var navBar = UINavigationBar(frame: CGRect(x: 0, y: 46, width: UIScreen.main.bounds.width, height: 40))
    
    private var collectionView = bannersCollectionView()
    private var menuCollectionView = MenuCollectionView()
    private let citiController = CitiesViewController()
    let pizza = PizzaViewController()
    var presenter: MenuViewPresenterProtocol!
    var senderDelegat = TrashViewController()
    
    //MARK: - VC lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
        table.delegate = self
        
        setViews()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        table.frame = CGRect(x: 0, y: 327, width: view.bounds.width, height: 570)
        table.rowHeight = 196
        tabBarItem = UITabBarItem(title: "Меню", image: UIImage(named: "menu"), tag: 0)
    }
    
    //MARK: - Actions
    @objc func chooseCity() {
        present(citiController, animated: true)
    }
    
    //MARK: - UI Settings
    func setNavigationBar() {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        button.setTitle("Москва", for: .normal)
        button.sizeToFit()
        button.semanticContentAttribute = .forceRightToLeft
        button.tintColor = .black
        button.addTarget(self, action: #selector(chooseCity), for: .touchUpInside)
        
        let navItem = UINavigationItem(title: "")
        navItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        navBar.setItems([navItem], animated: false)
        navBar.backgroundColor = .init(named: "Color")
        self.view.addSubview(navBar)
    }
    
    func setViews() {
        setNavigationBar()
        
        view.addSubview(table)
        view.addSubview(collectionView)
        view.addSubview(menuCollectionView)
        
        collectionView.sett(cells: banner.fetchBanners())
        menuCollectionView.sett(cells: menu.fetchBanners())
        
        view.backgroundColor = .init(named: "Color")
        title = "menu"
        navBar.barTintColor = .init(named: "Color")
        tabBarController?.tabBar.bounds = CGRect(x: 0, y: 0, width: 375, height: 83)
        
        setConstraints()
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
}

//MARK: - Table View
extension MenuViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! mainTableTableViewCell
        
        presenter.getImage(forKey: indexPath.row) { image in
            if let image = image {
                cell.img.image = image
            }
        }
        
        if let title = presenter.menuItems?[indexPath.row].title {
            cell.textField.text = title
        }
        cell.descriptionTextField.text = "Ветчина,шампиньоны, увеличинная порция моцареллы, томатный соус"
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let menuItem = presenter.menuItems?[indexPath.row]
        let cell = table.cellForRow(at: indexPath) as! mainTableTableViewCell
        let img = cell.img.image

        presenter.didTapCell(menuItem: menuItem, image: img)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.menuItems?.count ?? 0
    }
}

//MARK: - MenuViewProtocol
extension MenuViewController: MenuViewProtocol {
    func success() {
        table.reloadData()
    }
    
    func failure(error: Error) {
        let alert = UIAlertController(title: "Упс! Возникла ошибка", message: "Перезагрузите приложение", preferredStyle: .alert)
        show(alert, sender: nil)
    }
}
