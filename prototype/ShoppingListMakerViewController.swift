//
//  ShoppingListMakerViewController.swift
//  prototype
//
//  Created by Samuel Ntambwe on 2024-03-24.
//

import UIKit

class ShoppingListMakerViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var shoppingLists: [String] = [] // Array to store shopping list names
    let cellIdentifier = "ShoppingListCell"
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        return tableView
    }()
    
    let homeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Home", for: .normal)
        button.backgroundColor = .blue
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(homeButtonTapped), for: .touchUpInside)
        return button
    }()
    
    let salesTaxButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sales Tax", for: .normal)
        button.backgroundColor = .blue
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(salesTaxButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews() {
        view.addSubview(tableView)
        view.addSubview(homeButton)
        view.addSubview(salesTaxButton)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            tableView.heightAnchor.constraint(equalToConstant: 300),
            
            homeButton.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 20),
            homeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            homeButton.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -10),
            homeButton.heightAnchor.constraint(equalToConstant: 40),
            
            salesTaxButton.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 20),
            salesTaxButton.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 10),
            salesTaxButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            salesTaxButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    @objc func homeButtonTapped() {
        // Navigate to HomeViewController
        navigationController?.popToRootViewController(animated: true)
    }
    
    @objc func salesTaxButtonTapped() {
        // Navigate to SalesTaxViewController
        let salesTaxVC = SalesTaxViewController()
        navigationController?.pushViewController(salesTaxVC, animated: true)
    }
    
    // MARK: - Table View Data Source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingLists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.textLabel?.text = shoppingLists[indexPath.row]
        return cell
    }
    
    // MARK: - Table View Delegate
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        // Navigate to selected shopping list
//        let selectedListName = shoppingLists[indexPath.row]
//        let selectedShoppingListVC = SelectedShoppingListViewController(listName: selectedListName)
//        navigationController?.pushViewController(selectedShoppingListVC, animated: true)
//    }
}
