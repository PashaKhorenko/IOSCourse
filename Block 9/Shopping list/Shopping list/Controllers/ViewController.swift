//
//  ViewController.swift
//  Shopping list
//
//  Created by Паша Хоренко on 04.01.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private let tableViewCellId = "TabelViewCell"
    
    // MARK: - UI elements
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // MARK: - Data
    
    private var purchasesArray: [Purchase] = []

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        setupViews()
        setConstraints()
    }
    
    // MARK: - Settings
    
    private func setupViews() {
        self.title = "Shopping List"
        self.view.addSubview(tableView)
        
        tableView.register(TableViewCell.self, forCellReuseIdentifier: tableViewCellId)
        tableView.delegate = self
        tableView.dataSource = self
        
        let addBarButton = UIBarButtonItem(barButtonSystemItem: .add,
                                           target: self,
                                           action: #selector(addBarButtonPressed(_:)))
        
        self.navigationItem.rightBarButtonItem = addBarButton
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
    @objc func addBarButtonPressed(_ sender: UIBarButtonItem) {
        showAlert()
    }
    
    // MARK: - AlertController
    
    private func showAlert() {
        let alertController = UIAlertController(title: "New Purchase", message: "Add a new item to your shopping list", preferredStyle: .alert)
        
        alertController.addTextField { (textField) in
            textField.placeholder = "Enter a short title"
            textField.returnKeyType = .done
            textField.clearButtonMode = .whileEditing
        }
        
        let doneAction = UIAlertAction(title: "Done", style: .default) { _ in
            guard let text = alertController.textFields?.first?.text else { return }
            guard !text.isEmpty else { return }
            
            let titleText = text.trimmingCharacters(in: .whitespaces)
            let newProduct = Purchase(title: titleText, createdDate: .now)
            
            let indexPaths = [IndexPath(row: 0, section: 0)]
            
            self.purchasesArray.insert(newProduct, at: indexPaths.first!.row)
            self.tableView.insertRows(at: indexPaths, with: .fade)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alertController.addAction(doneAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true)
    }
}

// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        purchasesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCellId, for: indexPath) as! TableViewCell
        
        let data = purchasesArray[indexPath.row]
        cell.configure(with: data)
        
        return cell
    }
    
}

// MARK: - UITableViewDelegate

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(purchasesArray[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { [weak self] (action, view, completionHandler) in
            
            self?.purchasesArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            completionHandler(true)
        }
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}

// MARK: - Constraints

extension ViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
