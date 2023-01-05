//
//  Model.swift
//  Shopping list
//
//  Created by Паша Хоренко on 05.01.2023.
//

import Foundation
import RealmSwift

class Purchase: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var createdDate: Date = .now
}
