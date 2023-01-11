//
//  StandartActivityIndicator.swift
//  Popular Movies
//
//  Created by Паша Хоренко on 11.01.2023.
//

import UIKit

class StandartActivityIndicator: UIActivityIndicatorView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        startAnimating()
        style = .large
        hidesWhenStopped = true
        translatesAutoresizingMaskIntoConstraints = false
        
    }
}
