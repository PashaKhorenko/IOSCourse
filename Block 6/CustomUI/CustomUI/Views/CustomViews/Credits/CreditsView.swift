//
//  CreditsView.swift
//  CustomUI
//
//  Created by Паша Хоренко on 10.12.2022.
//

import UIKit

class CreditsView: UIView {
    
    @IBOutlet var contentView: CreditsView!
    
    @IBOutlet weak var greenBackgroundView: UIView!
    @IBOutlet weak var grayBackgroudView: UIView!
    
    @IBOutlet weak var settibgsButton: UIButton!
    @IBOutlet weak var infoButton: UIButton!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var limitLabel: UILabel!
    
    @IBOutlet weak var installmentPlanMenuBlock: MenuBlock!
    @IBOutlet weak var purchasePartsMenuBlock: MenuBlock!
    @IBOutlet weak var archiveMenuBlock: MenuBlock!
    
    private let xibName = "CreditsView"
    
    let backgroundColorForIconInstallment = #colorLiteral(red: 0.1098039216, green: 0.6901960784, blue: 0.4509803922, alpha: 1)
    let backgroundColorForIconPurchaseParts = #colorLiteral(red: 0.4862745098, green: 0.3803921569, blue: 0.7254901961, alpha: 1)
    let backgroundColorForIconArchive = #colorLiteral(red: 0.4666666667, green: 0.5725490196, blue: 0.6156862745, alpha: 1)
    
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
        greenBackgroundView.backgroundColor = #colorLiteral(red: 0.04705882353, green: 0.5490196078, blue: 0.3568627451, alpha: 1)
        grayBackgroudView.backgroundColor = #colorLiteral(red: 0.1176470588, green: 0.1176470588, blue: 0.1176470588, alpha: 1)
        
        titleLabel.text = "Доступний ліміт"
        titleLabel.textColor = .white
        titleLabel.font = .boldSystemFont(ofSize: 25)
        
        settibgsButton.tintColor = .white
        settibgsButton.setImage(UIImage(systemName: "line.3.horizontal.circle"), for: .normal)
        
        infoButton.tintColor = .white
        infoButton.setImage(UIImage(systemName: "info.circle"), for: .normal)
        
        limitLabel.text = "🇺🇦"
        limitLabel.textColor = .white
        limitLabel.font = .boldSystemFont(ofSize: 30)
        
        installmentPlanMenuBlock.configureWith(text: "Рострочка на карту",
                                               color: backgroundColorForIconInstallment,
                                               icon: UIImage(systemName: "creditcard.circle")!,
                                               type: .installmentPlan)
        purchasePartsMenuBlock.configureWith(text: "Покупка частинами",
                                             color: backgroundColorForIconPurchaseParts,
                                             icon: UIImage(systemName: "pawprint")!,
                                             type: .purchaseParts)
        archiveMenuBlock.configureWith(text: "Архів",
                                       color: backgroundColorForIconArchive,
                                       icon: UIImage(systemName: "checkmark.square")!,
                                       type: .archive)
    }
    
    @IBAction func settingsButtonPressed(_ sender: UIButton) {
        print(#function)
    }
    
    @IBAction func infoButtonPressed(_ sender: UIButton) {
        print(#function)
    }
}
