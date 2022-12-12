//
//  ThirdViewController.swift
//  Animations
//
//  Created by Паша Хоренко on 06.12.2022.
//

import UIKit
import Lottie

class ThirdViewController: UIViewController {

    @IBOutlet weak var startAnimationsButton: UIButton!
    @IBOutlet weak var developerAnimationView: LottieAnimationView!
    @IBOutlet weak var paperBoatsAnimationView: LottieAnimationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        developerAnimationView.stop()
        paperBoatsAnimationView.stop()
    }
    
    private func setupViews() {
        startAnimationsButton.setTitle("Start Animations!", for: .normal)
        
        developerAnimationView.backgroundColor = nil
        developerAnimationView.contentMode = .scaleAspectFit
        developerAnimationView.loopMode = .loop
        developerAnimationView.animationSpeed = 1
        
        paperBoatsAnimationView.backgroundColor = nil
        paperBoatsAnimationView.contentMode = .scaleAspectFit
        paperBoatsAnimationView.loopMode = .autoReverse
        paperBoatsAnimationView.animationSpeed = 0.7
    }
    
    @IBAction func startAnimationsButtonPressed(_ sender: UIButton) {
        developerAnimationView.play()
        paperBoatsAnimationView.play()
    }
}
