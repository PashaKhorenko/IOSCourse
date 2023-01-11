//
//  StorageManager.swift
//  Popular Movies
//
//  Created by Паша Хоренко on 11.01.2023.
//

import Foundation
import RealmSwift

enum ImageType {
    case posterImage
    case backdropImage
}

class StorageManager {
    
    private let realm = try! Realm()
    
    // MARK: - Save Movies
    
    func saveMoviesToRealm(_ movieResponses: [MovieServerResponse]) {
        do {
            try realm.write {
                for response in movieResponses {
                    let object = RealmMovie()

                    object.id = response.id!
                    object.title = response.title!
                    object.backdropPath = response.backdropPath!
                    object.posterPath = response.posterPath!
                    object.overview = response.overview!
                    object.releaseDate = response.releaseDate!
                    object.adult = response.adult!
                    object.popularity = response.popularity!
                    object.voteCount = response.voteCount!
                    object.voteAverage = response.voteAverage!
                    object.genreIDS.append(objectsIn: response.genreIDS!)

                    realm.add(object)
                }
            }
        } catch {
            print("Error movies saving: \(error.localizedDescription)")
        }
    }
    
    // MARK: - Save Genres
    
    func saveGenresToRealm(_ genresResponses: [GenreServerResponse]) {
        do {
            try realm.write {
                for response in genresResponses {
                    let object = RealmGenre()
                    
                    object.id = response.id!
                    object.name = response.name!
                    
                    realm.add(object)
                }
            }
        } catch {
            print("Error genres saving: \(error.localizedDescription)")
        }
    }
    
    // MARK: - Save Images
    
    func saveImageToRealm(imageData: Data, imageType: ImageType, id: Int) {
        do {
            try realm.write({
                switch imageType {
                    
                case .posterImage:
                    
                    let object = RealmPosterImage()
                    object.id = id
                    object.posterData = imageData
                    realm.add(object)
                    print("Save poster image #\(id) to realm")
                case .backdropImage:
                    
                    let object = RealmBackdropImage()
                    object.id = id
                    object.backdropData = imageData
                    realm.add(object)
                    print("Save backdrop image #\(id) to realm")
                }
            })
        } catch {
            print("Error image saving: \(error.localizedDescription)")
        }
    }
}
