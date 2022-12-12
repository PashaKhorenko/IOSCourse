//
//  ViewController.swift
//  CustomUI
//
//  Created by Паша Хоренко on 10.12.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var exchangeRateView: ExchangeRateView!
    @IBOutlet weak var creditsView: CreditsView!
    
    var delegate: MenuBlockDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemBackground
        
        delegateSetup()
    }
    
    private func delegateSetup() {
        creditsView.purchasePartsMenuBlock.delegate = self
        creditsView.installmentPlanMenuBlock.delegate = self
        creditsView.archiveMenuBlock.delegate = self
    }
}

extension ViewController: MenuBlockDelegate {
    func menuElementPressed(typeBlock: TypeBlock) {
        print(typeBlock)
    }
}
