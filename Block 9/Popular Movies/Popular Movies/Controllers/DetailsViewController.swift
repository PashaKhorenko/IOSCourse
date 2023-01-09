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
      
    // MARK: UI Elements
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let generalStackView = StandartStackView()
    private let reactionStackView = StandartStackView()
    private let overviewStackView = StandartStackView()
    
    private var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.startAnimating()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicator
    }()
    private var posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.backgroundColor = .systemGray4
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var titleLabel = TitleLabel()
    
    private var generalSubtitleLabel = SubtitleLabel()
    private var releaseDateLabel = StandartLabel()
    private var genresLabel = StandartLabel()
    private var ageRestrictionsLabel = StandartLabel()
    
    private var reactionSubtitleLabel = SubtitleLabel()
    private var averageScoreLabel = StandartLabel()
    private var scoreNumberLabel = StandartLabel()
    private var popularityLabel = StandartLabel()
    
    private var overviewSubtitleLabel = SubtitleLabel()
    private var overviewLabel = StandartLabel()
    
    // MARK: - Life Сycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        setupViews()
        
        populateUIForTheMovie()
    }
    
    private func setupViews() {
        navigationItem.largeTitleDisplayMode = .never
        
        self.view.backgroundColor = .systemBackground
        self.posterImageView.backgroundColor = .systemBackground
        
        generalSubtitleLabel.text = "General Information"
        reactionSubtitleLabel.text = "Reactions"
        overviewSubtitleLabel.text = "Overview"
        
        posterImageView.addSubview(activityIndicator)

        scrollView.addSubview(posterImageView)
        scrollView.addSubview(titleLabel)
        
        generalStackView.addArrangedSubview(generalSubtitleLabel)
        generalStackView.addArrangedSubview(releaseDateLabel)
        generalStackView.addArrangedSubview(genresLabel)
        generalStackView.addArrangedSubview(ageRestrictionsLabel)
        
        scrollView.addSubview(generalStackView)
        
        reactionStackView.addArrangedSubview(reactionSubtitleLabel)
        reactionStackView.addArrangedSubview(averageScoreLabel)
        reactionStackView.addArrangedSubview(scoreNumberLabel)
        reactionStackView.addArrangedSubview(popularityLabel)
        
        scrollView.addSubview(reactionStackView)
        
        overviewStackView.addArrangedSubview(overviewSubtitleLabel)
        overviewStackView.addArrangedSubview(overviewLabel)
        
        scrollView.addSubview(overviewStackView)
        
        view.addSubview(scrollView)
        
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



// MARK: - Constraints

extension DetailsViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            activityIndicator.centerYAnchor.constraint(equalTo: posterImageView.centerYAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: posterImageView.centerXAnchor),
            
            posterImageView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            posterImageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            posterImageView.widthAnchor.constraint(equalToConstant: view.frame.width),
            posterImageView.heightAnchor.constraint(equalTo: posterImageView.widthAnchor, multiplier: 0.6),

            titleLabel.topAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: 15),
            titleLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),

            generalStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            generalStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            generalStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),

            reactionStackView.topAnchor.constraint(equalTo: generalStackView.bottomAnchor, constant: 20),
            reactionStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            reactionStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),

            overviewStackView.topAnchor.constraint(equalTo: reactionStackView.bottomAnchor, constant: 20),
            overviewStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            overviewStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            overviewStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),

            overviewLabel.widthAnchor.constraint(equalToConstant: view.frame.width - 40)
        ])
    }
}
