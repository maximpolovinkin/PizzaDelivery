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
    table.translatesAutoresizingMaskIntoConstraints = false
    
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
        setViews()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        table.rowHeight = 156
        tabBarItem = UITabBarItem(title: "Меню", image: UIImage(named: "menu"), tag: 0)
    }
    
    //MARK: - Actions
    @objc func chooseCity() {
        present(citiController, animated: true)
    }
    
    //MARK: - UI Elements
    private var header: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    //MARK: - UI Settings
    func setupNavigationBar() {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        button.setTitle("Москва", for: .normal)
        button.sizeToFit()
        button.semanticContentAttribute = .forceRightToLeft
        button.tintColor = .black
        button.addTarget(self, action: #selector(chooseCity), for: .touchUpInside)
        
        navigationController?.navigationBar.topItem?.leftBarButtonItem = UIBarButtonItem(customView: button)
    
        navigationController?.navigationBar.barTintColor = .init(named: "Color")
        navigationController?.navigationBar.backgroundColor = .init(named: "Color")
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    func setViews() {
        table.dataSource = self
        table.delegate = self
        
        setupNavigationBar()
        
        view.addSubview(table)
        header.addSubview(collectionView)
        header.addSubview(menuCollectionView)
        view.addSubview(header)
        
        collectionView.sett(cells: banner.fetchBanners())
        menuCollectionView.sett(cells: menu.fetchBanners())
        
        view.backgroundColor = .init(named: "Color")
        tabBarController?.tabBar.bounds = CGRect(x: 0, y: 0, width: 375, height: 83)
        
        setConstraints()
    }
    
    private var bottomConstraint = NSLayoutConstraint()
    
    func setConstraints() {
        collectionView.contentInset.left = 5
        menuCollectionView.contentInset.left = 20
        bottomConstraint = header.bottomAnchor.constraint(equalTo: view.topAnchor, constant: 278)
        
        NSLayoutConstraint.activate([
            header.heightAnchor.constraint(equalToConstant: 234),
            header.leftAnchor.constraint(equalTo: view.leftAnchor),
            header.rightAnchor.constraint(equalTo: view.rightAnchor),
            bottomConstraint,
            
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            collectionView.topAnchor.constraint(equalTo: header.topAnchor, constant: 40),
            collectionView.heightAnchor.constraint(equalToConstant: 142),
            
            menuCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            menuCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            menuCollectionView.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 10),
            menuCollectionView.heightAnchor.constraint(equalToConstant: 42),
            
            table.leftAnchor.constraint(equalTo: view.leftAnchor),
            table.rightAnchor.constraint(equalTo: view.rightAnchor),
            table.topAnchor.constraint(equalTo: menuCollectionView.bottomAnchor, constant: 24),
            table.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
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

        presenter.getTitle(forKey: indexPath.row) { title in
            if let title = title {
                DispatchQueue.main.async {
                    cell.textField.text = title
                }
            }
        }

        cell.textField.sizeToFit()
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
        return presenter.menuItems?.count ?? 20
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

//MARK: - UIScrollViewDelegate
extension MenuViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let startOffset = scrollView.contentOffset.y + 0.0
        let newOffset = startOffset >= 140 ? 140 : 278 - startOffset + 5
        
        if startOffset >= 140{
            collectionView.isHidden = true
        } else {
            collectionView.isHidden = false
        }
        
        self.bottomConstraint.constant = CGFloat(newOffset)
        self.view.layoutIfNeeded()
    }
}
