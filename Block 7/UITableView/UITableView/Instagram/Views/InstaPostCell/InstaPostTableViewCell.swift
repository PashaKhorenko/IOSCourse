//
//  InstaPostTableViewCell.swift
//  UITableView
//
//  Created by Паша Хоренко on 15.12.2022.
//

import UIKit

class InstaPostTableViewCell: UITableViewCell {

    @IBOutlet weak var testLabel: UILabel!
    
    func configure(with text: String) {
        testLabel.text = text
    }
    
}
