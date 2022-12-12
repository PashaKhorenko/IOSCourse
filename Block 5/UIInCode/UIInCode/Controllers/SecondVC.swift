//
//  SecondVC.swift
//  UIInCode
//
//  Created by Паша Хоренко on 30.11.2022.
//

import UIKit

class SecondVC: UIViewController {
    
    private let greenCircle: UICircle = {
        var view = UICircle()
        view.backgroundColor = .systemGreen
        return view
    }()
    
    private let yellowCircle: UICircle = {
        var view = UICircle()
        view.backgroundColor = .systemYellow
        return view
    }()
    
    private let redCircle: UICircle = {
        var view = UICircle()
        view.backgroundColor = .systemRed
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Second VC"
        self.tabBarItem.image = UIImage(systemName: "2.circle.fill")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupViews()
        setConstraints()
    }
    
    func setupViews() {
        self.view.addSubview(greenCircle)
        self.view.addSubview(yellowCircle)
        self.view.addSubview(redCircle)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            yellowCircle.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            yellowCircle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            yellowCircle.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25),
            yellowCircle.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25),
            
            greenCircle.topAnchor.constraint(equalTo: yellowCircle.bottomAnchor),
            greenCircle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            greenCircle.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25),
            greenCircle.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25),
            
            redCircle.bottomAnchor.constraint(equalTo: yellowCircle.topAnchor),
            redCircle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            redCircle.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25),
            redCircle.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25)
        ])
    }
    
}
