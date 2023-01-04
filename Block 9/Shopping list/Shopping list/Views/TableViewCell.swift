//
//  TableViewCell.swift
//  Shopping list
//
//  Created by Паша Хоренко on 04.01.2023.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    // MARK: - UI elements
    
    private var testLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 20)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupViews()
    }


    required init?(coder: NSCoder) {
        super.init(coder: coder)

        setupViews()

    }
    
    // MARK: - Settings
    
    func configure(with data: String) {
        testLabel.text = data
    }
    
    private func setupViews() {
        addSubview(testLabel)
        
        NSLayoutConstraint.activate([
            testLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            testLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            testLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            testLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
}
