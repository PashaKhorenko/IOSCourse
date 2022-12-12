//
//  MenuBlockDelegate.swift
//  CustomUI
//
//  Created by Паша Хоренко on 10.12.2022.
//

import Foundation

enum TypeBlock {
    case installmentPlan
    case purchaseParts
    case archive
}

protocol MenuBlockDelegate {
    
    func menuElementPressed(typeBlock: TypeBlock)
}
