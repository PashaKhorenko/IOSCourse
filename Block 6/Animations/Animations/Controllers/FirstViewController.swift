//
//  FirstViewController.swift
//  Animations
//
//  Created by Паша Хоренко on 06.12.2022.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var bounceButton: UIButton!
    @IBOutlet weak var redCircle: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }
    
    private func setupViews() {
        bounceButton.setTitle("Bounce!", for: .normal)
        
        redCircle.backgroundColor = .red
        redCircle.layer.cornerRadius = self.redCircle.frame.height / 2
    }
    
    @IBAction func bounceButtonAction(_ sender: UIButton) {
        UIView.animate(withDuration: 1,
                       delay: 0,
                       usingSpringWithDamping: 4,
                       initialSpringVelocity: 5,
                       options: [.repeat, .autoreverse]) {
            self.redCircle.center.y = self.view.safeAreaInsets.bottom + self.redCircle.frame.height / 2
        }
    }
}

