//
//  RealmBackdropImage.swift
//  Popular Movies
//
//  Created by Паша Хоренко on 11.01.2023.
//

import Foundation
import RealmSwift

class RealmBackdropImage: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var backdropData: Data?
    
}
