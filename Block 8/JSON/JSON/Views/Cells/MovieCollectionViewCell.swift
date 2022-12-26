//
//  MovieCollectionViewCell.swift
//  JSON
//
//  Created by Паша Хоренко on 26.12.2022.
//

import UIKit
import Alamofire

class MovieCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
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
    
}
