//
//  DetailsViewController.swift
//  UITableView
//
//  Created by Паша Хоренко on 15.12.2022.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    var numberText: String = ""
    var cityNameText: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .systemBackground
        
        cityNameLabel.text = cityNameText
        numberLabel.text = numberText
    }
   
}
