//
//  MovieCollectionViewCell.swift
//  Popular Movies
//
//  Created by Паша Хоренко on 06.01.2023.
//

import UIKit
import Alamofire

class MovieCollectionViewCell: UICollectionViewCell {
    
    private var posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicator
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(fromMovie movie: Result) {
        activityIndicator.startAnimating()
        
        let imageURL = "https://image.tmdb.org/t/p/w500\(movie.posterPath ?? "")"
        
        AF.request(imageURL, method: .get)
            .validate()
            .responseData { response in
                guard let data = response.data else {
                    print("Failed to load image.")
                    return
                }
                self.posterImageView.image = UIImage(data: data)
                self.activityIndicator.stopAnimating()
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
