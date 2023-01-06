//
//  Genres.swift
//  Popular Movies
//
//  Created by Паша Хоренко on 06.01.2023.
//

import Foundation

// MARK: - Genres
struct Genres: Codable {
    var genres: [Genre]?
}

// MARK: - Genre
struct Genre: Codable {
    var id: Int?
    var name: String?
}
