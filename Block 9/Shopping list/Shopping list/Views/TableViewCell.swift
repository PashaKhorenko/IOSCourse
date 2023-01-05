//
//  TableViewCell.swift
//  Shopping list
//
//  Created by Паша Хоренко on 04.01.2023.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    // MARK: - UI elements
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 20)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var dateLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 17)
        label.textColor = .systemGray
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 0
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
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
    
    func configure(with data: Purchase) {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, d MMM yyyy HH:mm:ss"
        
        titleLabel.text = data.title
        dateLabel.text = formatter.string(from: data.createdDate)
    }
    
    private func setupViews() {
        addSubview(stackView)
        
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(dateLabel)
        
        NSLayoutConstraint.activate([            
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }
}
