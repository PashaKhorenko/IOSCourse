//
//  TrendsResponse.swift
//  Popular Movies
//
//  Created by Паша Хоренко on 06.01.2023.
//

import Foundation

// MARK: - Trends
struct Trends: Codable {
    var results: [MovieServerResponse]?
}

// MARK: - Result
struct MovieServerResponse : Codable {
    var adult: Bool?
    var backdropPath: String?
    var id: Int?
    var title: String?
    var overview, posterPath: String?
    var genreIDS: [Int]?
    var popularity: Double?
    var releaseDate: String?
    var voteAverage: Double?
    var voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case id, title
        case overview
        case posterPath = "poster_path"
        case genreIDS = "genre_ids"
        case popularity
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
