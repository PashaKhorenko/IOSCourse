//
//  Genres.swift
//  JSON
//
//  Created by Паша Хоренко on 26.12.2022.
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
