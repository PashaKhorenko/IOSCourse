//
//  Test.swift
//  Popular Movies
//
//  Created by Паша Хоренко on 09.01.2023.
//

import Foundation
import RealmSwift

class RealmMovie: Object {
    @Persisted(primaryKey: true) dynamic var id: Int = 0
    @Persisted dynamic var title: String = ""
    @Persisted dynamic var backdropPath: String = ""
    @Persisted dynamic var posterPath: String = ""
    @Persisted dynamic var overview: String = ""
    @Persisted dynamic var releaseDate: String = ""
    @Persisted dynamic var adult: Bool = false
    @Persisted dynamic var popularity: Double = 0
    @Persisted dynamic var voteCount: Int = 0
    @Persisted dynamic var voteAverage: Double = 0
    @Persisted dynamic var genreIDS = List<Int>()
}
