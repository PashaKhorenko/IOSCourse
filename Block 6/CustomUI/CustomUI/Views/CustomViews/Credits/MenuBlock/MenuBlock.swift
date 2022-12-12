//
//  MenuBlock.swift
//  CustomUI
//
//  Created by Паша Хоренко on 10.12.2022.
//

import UIKit

class MenuBlock: UIView {

    @IBOutlet var contentView: MenuBlock!
    
    @IBOutlet weak var conteinerForIconView: UIView!
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    private var typeBlock: TypeBlock?
    
    private let xibName = "MenuBlock"
    var delegate: MenuBlockDelegate?
        
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        commonInit()
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()

        conteinerForIconView.layer.cornerRadius = conteinerForIconView.frame.height / 2
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let _ = touches.first?.view,
           let type = typeBlock {
            delegate?.menuElementPressed(typeBlock: type)
        }
    }
    
    
    private func commonInit() {
        Bundle.main.loadNibNamed(xibName, owner: self)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
                
        setupViews()
    }
    
    func configureWith(text: String, color: UIColor, icon: UIImage, type: TypeBlock) {
        titleLabel.text = text
        conteinerForIconView.backgroundColor = color
        iconImageView.image = icon
        typeBlock = type
    }
    
    private func setupViews() {
        contentView.backgroundColor = #colorLiteral(red: 0.2030155063, green: 0.2030155063, blue: 0.2030155063, alpha: 1)
        contentView.layer.cornerRadius = 20
        
        titleLabel.numberOfLines = 2
        titleLabel.font = .boldSystemFont(ofSize: 18)
        titleLabel.textColor = .white
                
        iconImageView.tintColor = .white
    }
    
    
}
