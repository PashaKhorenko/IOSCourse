//
//  StandartLabel.swift
//  Popular Movies
//
//  Created by Паша Хоренко on 06.01.2023.
//

import UIKit

class StandartLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        numberOfLines = 0
        font = UIFont(name: "Avenir Next", size: 17)
        translatesAutoresizingMaskIntoConstraints = false
    }

}
