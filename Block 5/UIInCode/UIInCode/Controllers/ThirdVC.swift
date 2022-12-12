//
//  ThirdVC.swift
//  UIInCode
//
//  Created by Паша Хоренко on 30.11.2022.
//

import UIKit

class ThirdVC: UIViewController {

    private let greenCircle: UICircle = {
        var view = UICircle()
        view.backgroundColor = .systemGreen
        return view
    }()
    
    private let yellowCircle: UICircle = {
        var view = UICircle()
        view.backgroundColor = .systemYellow
        view.alpha = 0.7
        return view
    }()
    
    private let redCircle: UICircle = {
        var view = UICircle()
        view.backgroundColor = .systemRed
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Third VC"
        self.tabBarItem.image = UIImage(systemName: "3.circle.fill")

    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupViews()
        setConstraints()
    }
    
    func setupViews() {
        self.view.addSubview(greenCircle)
        self.view.addSubview(redCircle)
        self.view.addSubview(yellowCircle)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            yellowCircle.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            yellowCircle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            yellowCircle.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
            yellowCircle.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
            
            greenCircle.topAnchor.constraint(equalTo: yellowCircle.centerYAnchor, constant: 50),
            greenCircle.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            greenCircle.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
            greenCircle.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
            
            redCircle.bottomAnchor.constraint(equalTo: yellowCircle.centerYAnchor, constant: -50),
            redCircle.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            redCircle.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
            redCircle.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3)
        ])
    }
    
}
