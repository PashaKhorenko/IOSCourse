//
//  DetailsViewController.swift
//  JSON
//
//  Created by Паша Хоренко on 26.12.2022.
//

import UIKit
import Alamofire

class DetailsViewController: UIViewController {
  
    var allGenresArray: [Genre] = []
    var movie: Result? = nil
                
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var posterImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var genresLabel: UILabel!
    @IBOutlet weak var ageRestrictionsLabel: UILabel!
    
    @IBOutlet weak var averageScoreLabel: UILabel!
    @IBOutlet weak var scoreNumberLabel: UILabel!
    @IBOutlet weak var popularityLabel: UILabel!
    
    @IBOutlet weak var overviewLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        setupViews()
        
        populateUIForTheMovie()
    }
    
    private func setupViews() {
        navigationItem.largeTitleDisplayMode = .never
        
        self.view.backgroundColor = .systemBackground
        self.posterImageView.backgroundColor = .systemBackground
    }
    
    private func populateUIForTheMovie() {
        guard let movie else { return }
        
        downloadImage(byPath: movie.backdropPath ?? "")
        
        titleLabel.text = movie.title
        
        releaseDateLabel.text = "Relise date: \(movie.releaseDate ?? "Unfortunately, it is unknown.")"
        genresLabel.text = getMovieGenre(from: movie.genreIDS ?? [])
        
        if let adult = movie.adult {
            ageRestrictionsLabel.text = "Age restrictions: \(adult ? "Children are prohibited" : "Missing")"
        } else {
            ageRestrictionsLabel.text = "Age restrictions: No data available"
        }
        
        
        popularityLabel.text = "Popularity: \(movie.popularity ?? 0)"
        averageScoreLabel.text = "Average score: \(movie.voteAverage ?? 0)"
        scoreNumberLabel.text = "Number of votes: \(movie.voteCount ?? 0)"
        
        overviewLabel.text = movie.overview ?? ""
    }
    
    private func getMovieGenre(from movieGenres: [Int]) -> String {
        var result = "Genre: "
        
        for allGenre in allGenresArray {
            for movieGenreID in movieGenres {
                if movieGenreID == allGenre.id! {
                    result.append("\(allGenre.name!), ")
                }
            }
        }
        
        return String(result.dropLast(2))
    }
    
    private func downloadImage(byPath url: String) {
        let imageURL = "https://image.tmdb.org/t/p/w500\(url)"
        
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
    
}
