//
//  SecondViewController.swift
//  Animations
//
//  Created by Паша Хоренко on 06.12.2022.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var orangeCircle: UIView!
    @IBOutlet weak var runButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    private func setupViews() {
        orangeCircle.backgroundColor = .orange
        orangeCircle.layer.cornerRadius = self.orangeCircle.frame.height / 2
        
        runButton.setTitle("Run!", for: .normal)
    }

    @IBAction func runButtonAction(_ sender: UIButton) {
        let orangeCircleRadius = self.orangeCircle.frame.height / 2
        
        self.orangeCircle.isHidden = false
       
        UIView.animateKeyframes(withDuration: 8, delay: 0) {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5) {
                self.orangeCircle.center.x = self.view.frame.maxX - orangeCircleRadius - self.view.safeAreaInsets.right
            }
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.6) {
                self.orangeCircle.center.y = self.view.frame.maxY - (self.tabBarController?.tabBar.frame.height ?? 0) - orangeCircleRadius
            }
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5) {
                self.orangeCircle.center.x = self.view.frame.minX + orangeCircleRadius + self.view.safeAreaInsets.left
            }
            UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.6) {
                self.orangeCircle.center.y = self.view.frame.minY + orangeCircleRadius + self.view.safeAreaInsets.top
            }
        } completion: { _ in
            self.orangeCircle.isHidden = true
        }
    }
}
