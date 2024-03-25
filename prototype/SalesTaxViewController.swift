//
//  SalesTaxViewController.swift
//  prototype
//
//  Created by Samuel Ntambwe on 2024-03-24.
//

import UIKit

class SalesTaxViewController: UIViewController {
    
    let salesTaxTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter new sales tax"
        textField.textAlignment = .center
        textField.keyboardType = .decimalPad
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let updateButton: UIButton = {
        let button = UIButton()
        button.setTitle("Update Sales Tax", for: .normal)
        button.backgroundColor = .blue
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(updateButtonTapped), for: .touchUpInside)
        return button
    }()
    
    let homeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Home", for: .normal)
        button.backgroundColor = .blue
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(homeButtonTapped), for: .touchUpInside)
        return button
    }()
    
    let shoppingListButton: UIButton = {
        let button = UIButton()
        button.setTitle("Shopping List", for: .normal)
        button.backgroundColor = .blue
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(shoppingListButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
    }
    
    func setupViews() {
        view.addSubview(salesTaxTextField)
        view.addSubview(updateButton)
        view.addSubview(homeButton)
        view.addSubview(shoppingListButton)
        
        NSLayoutConstraint.activate([
            salesTaxTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            salesTaxTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            salesTaxTextField.widthAnchor.constraint(equalToConstant: 200),
            salesTaxTextField.heightAnchor.constraint(equalToConstant: 40),
            
            updateButton.topAnchor.constraint(equalTo: salesTaxTextField.bottomAnchor, constant: 20),
            updateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            updateButton.widthAnchor.constraint(equalToConstant: 200),
            updateButton.heightAnchor.constraint(equalToConstant: 40),
            
            homeButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            homeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            homeButton.widthAnchor.constraint(equalToConstant: 100),
            homeButton.heightAnchor.constraint(equalToConstant: 40),
            
            shoppingListButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            shoppingListButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            shoppingListButton.widthAnchor.constraint(equalToConstant: 150),
            shoppingListButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    @objc func updateButtonTapped() {
        guard let newSalesTaxText = salesTaxTextField.text,
              let newSalesTax = Float(newSalesTaxText) else {
            // Show an alert or handle invalid input
            return
        }
        // Handle updating the sales tax rate
        
        // For example, you might store the new sales tax rate in UserDefaults or a database
        UserDefaults.standard.set(newSalesTax, forKey: "SalesTaxRate")
        
        // Show success message or perform any other action
        
        // Clear the text field after updating
        salesTaxTextField.text = ""
    }
    
    @objc func homeButtonTapped() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @objc func shoppingListButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}
