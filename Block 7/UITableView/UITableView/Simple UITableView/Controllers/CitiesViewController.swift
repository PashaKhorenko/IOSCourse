//
//  CitiesViewController.swift
//  UITableView
//
//  Created by Паша Хоренко on 15.12.2022.
//

import UIKit

class CitiesViewController: UIViewController {

    @IBOutlet weak var citiesTableView: UITableView!
    
    private var data = ["Київ", "Львів", "Чернігів", "Луцьк", "Вінниця", "Рівне", "Івано-Франківськ", "Одеса", "Харків", "Хмельницький", "Ужгород", "Житомир", "Полтава", "Запоріжжя", "Миколаїв", "Суми", "Херсон"] {
        didSet {
            self.citiesTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        citiesTableView.delegate = self
        citiesTableView.dataSource = self
        
        citiesTableView.register(UITableViewCell.self, forCellReuseIdentifier: "CityTableViewCell")
    }
    
    @IBAction func addCityButtonPressed(_ sender: UIBarButtonItem) {
        showAlert()
    }
    
    private func showAlert() {
        let alertController = UIAlertController(title: "New City", message: "Add the name of the city ", preferredStyle: .alert)
        
        let doneAction = UIAlertAction(title: "Done", style: .default) { _ in
            
            guard let text = alertController.textFields?[0].text else { return }
            let cityName = text.trimmingCharacters(in: .whitespaces)
            
            if !cityName.isEmpty {
                self.data.insert(cityName, at: 0)
            }
            
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alertController.addTextField { textField in
            textField.returnKeyType = .done
            textField.clearButtonMode = .whileEditing
            textField.placeholder = "Enter a name city"
        }
        
        alertController.addAction(doneAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true)
    }
    
}

// MARK: - UITableViewDataSource

extension CitiesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityTableViewCell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
    
}

// MARK: - UITableViewDelegate

extension CitiesViewController: UITableViewDelegate {
    
    // Click on the cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let detailsVC = storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController else { return }
        
        detailsVC.cityNameText = data[indexPath.row]
        detailsVC.numberText = String(indexPath.row)
        
        navigationController?.pushViewController(detailsVC, animated: true)
        
        citiesTableView.deselectRow(at: indexPath, animated: true)
    }
    
    // Swipe right
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

        // Delete action
        let deleteAction = UIContextualAction(style: .destructive, title: "nil") { [weak self] (action, view, completionHandler) in

            self?.data.remove(at: indexPath.row)
            completionHandler(true)
        }
        deleteAction.image = UIImage(systemName: "trash")

        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])

        return configuration
    }
}
