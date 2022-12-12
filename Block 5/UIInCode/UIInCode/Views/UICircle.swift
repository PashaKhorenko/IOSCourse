//
//  UICircle.swift
//  UIInCode
//
//  Created by Паша Хоренко on 30.11.2022.
//

import UIKit

class UICircle: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)

        setup()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        layer.cornerRadius = self.frame.height / 2
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    func setup() {
        backgroundColor = .black
        translatesAutoresizingMaskIntoConstraints = false
    }
}
