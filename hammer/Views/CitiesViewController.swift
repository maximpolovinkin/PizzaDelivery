//
//  CitiesViewController.swift
//  hammer
//
//  Created by Максим Половинкин on 17.01.2023.
//

import UIKit

class CitiesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
    
    private let cities = ["Москва", "Ковров", "Унеча", "Владивосток", "Абакан", "Киров", "Крым", "Симферополь", "Владимир", "Выкса", "Нижний Новгород", "Брянск", "Москва", "Ковров", "Унеча", "Владивосток", "Абакан", "Киров", "Крым", "Симферополь", "Владимир", "Выкса", "Нижний Новгород", "Брянск"]
    
    private var filteredCities = [String]()
    
    private var citiesTable: UITableView = {
        let citiesTable = UITableView(frame: CGRect(x: 0, y: 0, width: 770, height: 270), style: .grouped)
        citiesTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
       
        return citiesTable
    }()

    private let searchContr = UISearchController(searchResultsController: nil)
    private var searchIsEmpty : Bool {
        guard let text = searchContr.searchBar.text else { return false }
        return text.isEmpty
    }
    
    private var isFiltering : Bool {
        return searchContr.isActive && !searchIsEmpty
    }
    
    override func viewWillLayoutSubviews() {
        let width = self.view.frame.width
        let navigationBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: width, height: 70))
        self.view.addSubview(navigationBar);
        let navItem = UINavigationItem(title: "Выберите город")
        let doneBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.close, target: nil, action: #selector(close))
        navItem.leftBarButtonItem = doneBtn
        navigationBar.setItems([navItem], animated: false)
    }
    
   
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        citiesTable.frame = CGRect(x: 0, y: 57, width: view.bounds.width, height: view.bounds.height)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        citiesTable.tableHeaderView = searchContr.searchBar
        navigationItem.hidesSearchBarWhenScrolling = false
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         if isFiltering {
             return filteredCities.count
         }
         return cities.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
         if isFiltering{
             let city = filteredCities[indexPath.row]
             cell.textLabel?.text = city
         } else {
             let city = cities[indexPath.row]
             cell.textLabel?.text = city
         }
        
        
        return cell
    }
    
    @objc func close() {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func setUpViews() {
        //Main View
        view.backgroundColor = .white
        view.addSubview(citiesTable)
        //Search Controller
        searchContr.searchResultsUpdater = self
        searchContr.obscuresBackgroundDuringPresentation = false
        searchContr.searchBar.placeholder = "Найти город"
        navigationItem.searchController = searchContr
        definesPresentationContext = true
        
        //Table
        citiesTable.dataSource = self
        citiesTable.delegate = self
       
        
    }
}

extension CitiesViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterData(searchQuery: searchController.searchBar.text!)
    }

    private func filterData(searchQuery: String) {
        filteredCities = cities.filter{$0.lowercased().contains(searchQuery.lowercased())}
        
        citiesTable.reloadData()
    }

}
