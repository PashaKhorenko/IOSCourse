//
//  FourthVC.swift
//  UIInCode
//
//  Created by Паша Хоренко on 30.11.2022.
//

import UIKit

class FourthVC: UIViewController {
    
    private let mainCircle: UICircle = {
        var view = UICircle()
        view.backgroundColor = nil
        view.layer.masksToBounds = true
        return view
    }()
    
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
    
    private let blueCircle: UICircle = {
        var view = UICircle()
        view.backgroundColor = .systemBlue
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Fourth VC"
        self.tabBarItem.image = UIImage(systemName: "4.circle.fill")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupViews()
        setConstraints()
    }
    
    func setupViews() {
        self.view.addSubview(mainCircle)
        mainCircle.addSubview(redCircle)
        mainCircle.addSubview(yellowCircle)
        mainCircle.addSubview(greenCircle)
        mainCircle.addSubview(blueCircle)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            mainCircle.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            mainCircle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainCircle.heightAnchor.constraint(equalTo: view.widthAnchor),
            mainCircle.widthAnchor.constraint(equalTo: view.widthAnchor),
            
            greenCircle.centerYAnchor.constraint(equalTo: mainCircle.centerYAnchor, constant: 100),
            greenCircle.centerXAnchor.constraint(equalTo: mainCircle.centerXAnchor, constant: 100),
            greenCircle.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.65),
            greenCircle.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.65),
            
            blueCircle.centerYAnchor.constraint(equalTo: mainCircle.centerYAnchor, constant: 100),
            blueCircle.centerXAnchor.constraint(equalTo: mainCircle.centerXAnchor, constant: -100),
            blueCircle.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.65),
            blueCircle.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.65),
            
            redCircle.centerYAnchor.constraint(equalTo: mainCircle.centerYAnchor, constant: -100),
            redCircle.centerXAnchor.constraint(equalTo: mainCircle.centerXAnchor, constant: -100),
            redCircle.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.65),
            redCircle.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.65),
            
            yellowCircle.centerYAnchor.constraint(equalTo: mainCircle.centerYAnchor, constant: -100),
            yellowCircle.centerXAnchor.constraint(equalTo: mainCircle.centerXAnchor, constant: 100),
            yellowCircle.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.65),
            yellowCircle.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.65),
        ])
    }
}
