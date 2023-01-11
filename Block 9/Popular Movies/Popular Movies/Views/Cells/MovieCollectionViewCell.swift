//
//  MovieCollectionViewCell.swift
//  Popular Movies
//
//  Created by Паша Хоренко on 06.01.2023.
//

import UIKit
import Alamofire
import RealmSwift

class MovieCollectionViewCell: UICollectionViewCell {
    
    private let networkManager = NetworkManager()
    private let realm = try! Realm()
    
    private var posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private var activityIndicator = StandartActivityIndicator(frame: .zero)
    
    private var posterImagesArray: Results<RealmPosterImage>!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        posterImagesArray = realm.objects(RealmPosterImage.self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(fromMovie movie: RealmMovie, with imageId: Int) {
//        networkManager.downloadImage(dyPash: movie.posterPath,
//                                     for: posterImageView, activityIndicator,
//                                     with: .posterImage, imageId: imageId)
        if posterImagesArray.isEmpty {
            networkManager.downloadImage(dyPash: movie.posterPath,
                                         for: posterImageView, activityIndicator,
                                         with: .posterImage, imageId: imageId)
        } else {
            let isIndexValid = posterImagesArray.indices.contains(imageId)
            
            if isIndexValid {
                if let imageData = posterImagesArray[imageId].posterData {
                    print("PosterImage #\(imageId) from REALM")
                    posterImageView.image = UIImage(data: imageData)
                    activityIndicator.stopAnimating()
                }
            } else {
                networkManager.downloadImage(dyPash: movie.posterPath,
                                             for: posterImageView, activityIndicator,
                                             with: .posterImage, imageId: imageId)
            }
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        backgroundColor = .systemGray
        
        layer.cornerRadius = 10
        layer.masksToBounds = true
    }
    
    private func setupViews() {
        addSubview(posterImageView)
        posterImageView.addSubview(activityIndicator)
        
        NSLayoutConstraint.activate([
            posterImageView.topAnchor.constraint(equalTo: topAnchor),
            posterImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            posterImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            posterImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            activityIndicator.centerXAnchor.constraint(equalTo: posterImageView.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: posterImageView.centerYAnchor)
        ])
    }
}
