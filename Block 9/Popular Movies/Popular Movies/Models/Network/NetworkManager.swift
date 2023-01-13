//
//  NetworkManager.swift
//  Popular Movies
//
//  Created by Паша Хоренко on 10.01.2023.
//

import Foundation
import Alamofire
import RealmSwift

class NetworkManager {
    
    private let realm = try! Realm()
    private let storageManager = StorageManager()
    
    // MARK: - Downloading Movies
    
    func downloadMovies(byPath url: String, for collectionView: UICollectionView) {
        AF.request(url)
            .validate()
            .responseDecodable(of: Trends.self) { (response) in
                guard response.error == nil else { return }
                guard let movies = response.value?.results else { return }
                
                let realmMovies = self.realm.objects(RealmMovie.self)
                
                if realmMovies.isEmpty {
                    self.storageManager.saveMoviesToRealm(movies)
                    print("Realm save movies")
                }
                collectionView.reloadData()
                print("collectionView.reloadData()")
            }
    }
    
    // MARK: - Downloading Genres
    
    func downloadGenres(byPath url: String) {
        AF.request(url)
            .validate()
            .responseDecodable(of: Genres.self) { (response) in
                guard let genres = response.value?.genres else { return }
                
                let realmGenres = self.realm.objects(RealmGenre.self)
                
                if realmGenres.isEmpty {
                    self.storageManager.saveGenresToRealm(genres)
                    print("Realm save genres")
                }
            }
    }
    
    // MARK: - Downloading Images
    
    func downloadImage(dyPash url: String,
                       for imageView: UIImageView, _ activityIndicator: UIActivityIndicatorView,
                       with type: ImageType, imageId: Int) {
        
        let imageURL = "https://image.tmdb.org/t/p/w500\(url)"
        
        AF.request(imageURL, method: .get)
            .validate()
            .responseData { response in
                guard response.error == nil else { return }
                guard let data = response.data else {
                    print("Failed to load image.")
                    return
                }

                switch type {
                case .posterImage:
                    self.storageManager.saveImageToRealm(imageData: data, imageType: type, id: imageId)
                case .backdropImage:
                    self.storageManager.saveImageToRealm(imageData: data, imageType: type, id: imageId)
                }
                
                imageView.image = UIImage(data: data)
                activityIndicator.stopAnimating()
            }
    }
}
