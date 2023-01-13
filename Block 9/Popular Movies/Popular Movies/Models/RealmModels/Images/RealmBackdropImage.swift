//
//  RealmBackdropImage.swift
//  Popular Movies
//
//  Created by Паша Хоренко on 11.01.2023.
//

import Foundation
import RealmSwift

class RealmBackdropImage: Object {
    @Persisted(primaryKey: true) dynamic var id: Int = 0
    @Persisted dynamic var backdropData: Data?
    
}
