//
//  Test.swift
//  Popular Movies
//
//  Created by Паша Хоренко on 09.01.2023.
//

import Foundation
import RealmSwift

class RealmMovie: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var title: String = ""
    @objc dynamic var backdropPath: String = ""
    @objc dynamic var posterPath: String = ""
    @objc dynamic var overview: String = ""
    @objc dynamic var releaseDate: String = ""
    @objc dynamic var adult: Bool = false
    @objc dynamic var popularity: Double = 0
    @objc dynamic var voteCount: Int = 0
    @objc dynamic var voteAverage: Double = 0
//    @objc dynamic var genreIDS = List<Int>()
    dynamic var genreIDS = List<Int>()
}

//class IntObject: Object {
//    dynamic var value: Int = 0
//}
