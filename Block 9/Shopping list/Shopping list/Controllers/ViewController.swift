//
//  ViewController.swift
//  Shopping list
//
//  Created by Паша Хоренко on 04.01.2023.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    
    private let tableViewCellId = "TabelViewCell"
    private let realm = try! Realm()
    
    // MARK: - UI elements
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // MARK: - Data
    
    private var purchasesArray: Results<Purchase>!
    
    private func save(with title: String, _ date: Date = .now) {
        let newProduct = Purchase()
        newProduct.title = title
        newProduct.createdDate = date
        
        realm.beginWrite()
        realm.add(newProduct)
        try! realm.commitWrite()
    }

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        setupViews()
        setConstraints()
        
        purchasesArray = realm.objects(Purchase.self)
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
            let titleText = text.trimmingCharacters(in: .whitespacesAndNewlines)
            guard titleText != "" else { return }
            
            self.save(with: titleText)
            
            let indexPaths = [IndexPath(row: self.purchasesArray.count - 1, section: 0)]
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
        guard !purchasesArray.isEmpty else {
            self.tableView.setEmptyMessage("""
                                            Your shopping list is currently empty.
                                            To add a new purchase to the list, click on the
                                            \"+\" button in the upper right corner.
                                            """)
            return 0
        }
        self.tableView.restore()
        return purchasesArray.count
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
        
        let editingRow = purchasesArray[indexPath.row]
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { [weak self] (action, view, completionHandler) in
            
            self?.realm.beginWrite()
            self?.realm.delete(editingRow)
            try! self?.realm.commitWrite()
            
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
