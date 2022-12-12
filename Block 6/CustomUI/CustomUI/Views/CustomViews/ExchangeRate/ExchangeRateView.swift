//
//  ExchangeRateView.swift
//  CustomUI
//
//  Created by Паша Хоренко on 10.12.2022.
//

import UIKit

class ExchangeRateView: UIView {

    @IBOutlet var contentView: ExchangeRateView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var backgroundForLabelsView: UIView!
    @IBOutlet weak var barrierLineView: UIView!
    
    @IBOutlet weak var dollarTopLabel: UILabel!
    @IBOutlet weak var dollarBottomLabel: UILabel!
    
    @IBOutlet weak var euroTopLabel: UILabel!
    @IBOutlet weak var euroBottomLabel: UILabel!
    
    private let xibName = "ExchangeRateView"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed(xibName, owner: self)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        setupViews()
    }
    
    private func setupViews() {
        contentView.backgroundColor = #colorLiteral(red: 0.231372549, green: 0.3254901961, blue: 0.4, alpha: 1)
        
        barrierLineView.backgroundColor = #colorLiteral(red: 0.231372549, green: 0.3254901961, blue: 0.4, alpha: 1)
        
        titleLabel.text = "Ще"
        titleLabel.font = .boldSystemFont(ofSize: 25)
        titleLabel.textColor = .white
        
        backgroundForLabelsView.layer.cornerRadius = 20
        backgroundForLabelsView.backgroundColor = #colorLiteral(red: 0.3411764706, green: 0.4392156863, blue: 0.5098039216, alpha: 1)
        
        dollarTopLabel.text = "Долар США"
        dollarTopLabel.textColor = .systemGray4
        dollarTopLabel.font = .systemFont(ofSize: 15)
        
        dollarBottomLabel.text = "🇺🇸  36.63 / 37.44"
        dollarBottomLabel.font = .boldSystemFont(ofSize: 18)
        dollarBottomLabel.textColor = .white
        
        euroTopLabel.text = "Євро"
        euroTopLabel.textColor = .systemGray4
        euroTopLabel.font = .systemFont(ofSize: 15)
        
        euroBottomLabel.text = "🇪🇺  38.65 / 39.75"
        euroBottomLabel.font = .boldSystemFont(ofSize: 18)
        euroBottomLabel.textColor = .white
    }
}
