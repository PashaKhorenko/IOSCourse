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
    
    private let storageManager = StorageManager()
    private let networkManager = NetworkManager()
    
    private let realm = try! Realm()
    
    // MARK: UI elements
    private var posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private var activityIndicator = StandartActivityIndicator(frame: .zero)
    
    // MARK: Data
    private var posterImagesArray: Results<RealmPosterImage>!
    
    
    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        posterImagesArray = realm.objects(RealmPosterImage.self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Views Lifecycle
    override func layoutSubviews() {
        super.layoutSubviews()
        
        backgroundColor = .systemGray
        
        layer.cornerRadius = 10
        layer.masksToBounds = true
    }
    
    // MARK: Public
    func configure(fromMovie movie: RealmMovie, with id: Int) {
        
        if posterImagesArray.contains(where: { $0.id == id }) {
            storageManager.getImage(for: posterImageView, activityIndicator, with: id, .posterImage)
        } else {
            networkManager.downloadImage(dyPash: movie.posterPath, for: posterImageView, activityIndicator, with: .posterImage, imageId: id)
        }
    }
    
    // MARK: Private
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
