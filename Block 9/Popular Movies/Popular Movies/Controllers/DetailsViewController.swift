//
//  DetailsViewController.swift
//  Popular Movies
//
//  Created by Паша Хоренко on 06.01.2023.
//

import UIKit
import Alamofire

class DetailsViewController: UIViewController {

    var allGenresArray: [Genre] = []
    var movie: Result? = nil
                
    private var activityIndicator = UIActivityIndicatorView()
    private var posterImageView = UIImageView()
    
    private var titleLabel = UILabel()
    
    private var releaseDateLabel = UILabel()
    private var genresLabel = UILabel()
    private var ageRestrictionsLabel = UILabel()
    
    private var averageScoreLabel = UILabel()
    private var scoreNumberLabel = UILabel()
    private var popularityLabel = UILabel()
    
    private var overviewLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        setupViews()
        
        populateUIForTheMovie()
    }
    
    private func setupViews() {
        navigationItem.largeTitleDisplayMode = .never
        
        self.view.backgroundColor = .systemBackground
        self.posterImageView.backgroundColor = .systemBackground
        
        view.addSubview(posterImageView)
        posterImageView.addSubview(activityIndicator)
        view.addSubview(titleLabel)
        view.addSubview(releaseDateLabel)
        view.addSubview(genresLabel)
        view.addSubview(ageRestrictionsLabel)
        view.addSubview(averageScoreLabel)
        view.addSubview(scoreNumberLabel)
        view.addSubview(popularityLabel)
        view.addSubview(overviewLabel)
        
        setConstraints()
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

extension DetailsViewController {
    private func setConstraints() {
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        posterImageView.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        releaseDateLabel.translatesAutoresizingMaskIntoConstraints = false
        genresLabel.translatesAutoresizingMaskIntoConstraints = false
        ageRestrictionsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        averageScoreLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        popularityLabel.translatesAutoresizingMaskIntoConstraints = false
        
        overviewLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            posterImageView.topAnchor.constraint(equalTo: view.topAnchor),
            posterImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            posterImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            posterImageView.heightAnchor.constraint(equalToConstant: 150),
            
            activityIndicator.centerYAnchor.constraint(equalTo: posterImageView.centerYAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: posterImageView.centerXAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: 15),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            releaseDateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            releaseDateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            releaseDateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            genresLabel.topAnchor.constraint(equalTo: releaseDateLabel.bottomAnchor, constant: 10),
            genresLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            genresLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            ageRestrictionsLabel.topAnchor.constraint(equalTo: genresLabel.bottomAnchor, constant: 10),
            ageRestrictionsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            ageRestrictionsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            averageScoreLabel.topAnchor.constraint(equalTo: ageRestrictionsLabel.bottomAnchor, constant: 20),
            averageScoreLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            averageScoreLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            scoreNumberLabel.topAnchor.constraint(equalTo: averageScoreLabel.bottomAnchor, constant: 10),
            scoreNumberLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            scoreNumberLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            popularityLabel.topAnchor.constraint(equalTo: scoreNumberLabel.bottomAnchor, constant: 10),
            popularityLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            popularityLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            overviewLabel.topAnchor.constraint(equalTo: popularityLabel.bottomAnchor, constant: 20),
            overviewLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            overviewLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            overviewLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
    }
}
