//
//  DetailsViewController.swift
//  JSON
//
//  Created by Паша Хоренко on 26.12.2022.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var movie: Result? = nil
            
    @IBOutlet weak var testLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .systemBackground
                
        presentMovie()
    }
    
    func presentMovie() {
        guard let movie else { return }
        testLabel.text = String(repeating: "\(movie)", count: 5)
    }
    
}
