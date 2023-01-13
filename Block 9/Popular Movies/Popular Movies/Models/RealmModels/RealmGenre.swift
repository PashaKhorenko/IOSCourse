//
//  RealmGenre.swift
//  Popular Movies
//
//  Created by Паша Хоренко on 09.01.2023.
//

import Foundation
import RealmSwift

class RealmGenre: Object {
    @Persisted(primaryKey: true) dynamic var id: Int = 0
    @Persisted dynamic var name: String = ""
}
