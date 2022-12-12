//
//  FirstVC.swift
//  UIInCode
//
//  Created by Паша Хоренко on 30.11.2022.
//

import UIKit

class FirstVC: UIViewController {
  
    private let greenCircle: UICircle = {
        var view = UICircle()
        view.backgroundColor = .systemGreen
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "First VC"
        self.tabBarItem.image = UIImage(systemName: "1.circle.fill")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupViews()
        setConstraints()
    }
    
    func setupViews() {
        self.view.addSubview(greenCircle)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            greenCircle.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            greenCircle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            greenCircle.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
            greenCircle.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3)
        ])
    }
}
