//
//  Service.swift
//  Popular Movies
//
//  Created by Паша Хоренко on 10.01.2023.
//

import Foundation
import Alamofire
import RealmSwift

class NetworkService {
    
    private let realm = try! Realm()
    
    // MARK: - Downloading data / Public
    func downloadMovies(byPath url: String, for collectionView: UICollectionView) {
        AF.request(url)
            .validate()
            .responseDecodable(of: Trends.self) { (response) in
                guard response.error == nil else { return }
                guard let movies = response.value?.results else { return }
                
                let realmMovies = self.realm.objects(RealmMovie.self)
                
                if realmMovies.isEmpty {
                    self.saveMoviesToRealm(movies)
                    print("Realm save movies")
                    
                }
                collectionView.reloadData()
                print("collectionView.reloadData()")
            }
    }
    
    func downloadGenres(byPath url: String) {
        AF.request(url)
            .validate()
            .responseDecodable(of: Genres.self) { (response) in
                guard let genres = response.value?.genres else { return }
                
                let realmGenres = self.realm.objects(RealmGenre.self)
                
                if realmGenres.isEmpty {
                    self.saveGenresToRealm(genres)
                    print("Realm save genres")
                }
            }
    }
    
    // MARK: - Saving to Realm / Private
    
    private func saveMoviesToRealm(_ movieResponses: [MovieServerResponse]) {
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
    
    private func saveGenresToRealm(_ genresResponses: [GenreServerResponse]) {
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
    
}
