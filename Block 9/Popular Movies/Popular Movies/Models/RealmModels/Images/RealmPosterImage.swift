//
//  RealmPosterImage.swift
//  Popular Movies
//
//  Created by Паша Хоренко on 11.01.2023.
//

import Foundation
import RealmSwift

class RealmPosterImage: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var posterData: Data?
}
