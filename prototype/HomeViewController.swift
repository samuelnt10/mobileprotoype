import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let items = ["Clothes", "Medicine", "Food"]
    let prices: [Float] = [10.0, 20.0, 30.0] // Example prices
    let cellIdentifier = "ItemCell"
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        return tableView
    }()
    
    let calculationTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Total Price"
        textField.textAlignment = .center
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.isUserInteractionEnabled = false
        return textField
    }()
    
    let salesTaxButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sales Tax", for: .normal)
        button.backgroundColor = .blue
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(salesTaxButtonTapped), for: .touchUpInside)
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
        setupViews()
        calculateTotalPrice()
    }
    
    func setupViews() {
        view.addSubview(tableView)
        view.addSubview(calculationTextField)
        view.addSubview(salesTaxButton)
        view.addSubview(shoppingListButton)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            tableView.heightAnchor.constraint(equalToConstant: 200),
            
            calculationTextField.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 20),
            calculationTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            calculationTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            calculationTextField.heightAnchor.constraint(equalToConstant: 40),
            
            salesTaxButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            salesTaxButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            salesTaxButton.widthAnchor.constraint(equalToConstant: 100),
            salesTaxButton.heightAnchor.constraint(equalToConstant: 40),
            
            shoppingListButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            shoppingListButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            shoppingListButton.widthAnchor.constraint(equalToConstant: 150),
            shoppingListButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    func calculateTotalPrice() {
        let totalPrice = prices.reduce(0, +)
        calculationTextField.text = "$\(totalPrice)"
    }
    
    // MARK: - Table View Data Source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        let item = items[indexPath.row]
        cell.textLabel?.text = item
        return cell
    }
    
    @objc func salesTaxButtonTapped() {
        let salesTaxVC = SalesTaxViewController()
        navigationController?.pushViewController(salesTaxVC, animated: true)
    }
    
    @objc func shoppingListButtonTapped() {
        let shoppingListVC = ShoppingListMakerViewController()
        navigationController?.pushViewController(shoppingListVC, animated: true)
    }
}
