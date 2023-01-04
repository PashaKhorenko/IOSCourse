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
    
    private var purchasesArray: [String] = []

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for item in 0...20 {
            purchasesArray.append(String(item))
        }
 
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
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
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
        print(indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
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
