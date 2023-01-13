//
//  DetailsViewController.swift
//  Popular Movies
//
//  Created by Паша Хоренко on 06.01.2023.
//

import UIKit
import Alamofire
import RealmSwift

class DetailsViewController: UIViewController {
    
    private let realm = try! Realm()
    private let networkManager = NetworkManager()
    private let storageManager = StorageManager()
    
    private var genresArray: Results<RealmGenre>!
    private var backdropImagesArray: Results<RealmBackdropImage>!
    
    var movie: RealmMovie? = nil
    var imageId: Int = 0
      
    // MARK: UI Elements
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let generalStackView = StandartStackView()
    private let reactionStackView = StandartStackView()
    private let overviewStackView = StandartStackView()
    
    private var activityIndicator = StandartActivityIndicator(frame: .zero)
    private var backdropImageView: UIImageView = {
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
    
    // MARK: - Views Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
          
        genresArray = realm.objects(RealmGenre.self)
        backdropImagesArray = realm.objects(RealmBackdropImage.self)
        setupViews()
        
        populateUIForTheMovie()
    }
    
    // MARK: - Settings
    private func setupViews() {
        navigationItem.largeTitleDisplayMode = .never
        
        self.view.backgroundColor = .systemBackground
        self.backdropImageView.backgroundColor = .systemGray
        
        generalSubtitleLabel.text = "General Information"
        reactionSubtitleLabel.text = "Reactions"
        overviewSubtitleLabel.text = "Overview"
        
        backdropImageView.addSubview(activityIndicator)

        scrollView.addSubview(backdropImageView)
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
        
        if backdropImagesArray.contains(where: { $0.id == self.imageId }) {
            storageManager.getImage(for: backdropImageView, activityIndicator, with: self.imageId, .backdropImage)
        } else {
            networkManager.downloadImage(dyPash: movie.backdropPath, for: backdropImageView, activityIndicator, with: .backdropImage, imageId: self.imageId)
        }
                
        titleLabel.text = movie.title
        
        releaseDateLabel.text = "Relise date: \(movie.releaseDate)"
        genresLabel.text = getMovieGenre(from: movie.genreIDS.convertToArray())

        if movie.adult {
            ageRestrictionsLabel.text = "Age restrictions: Children are prohibited"
        } else {
            ageRestrictionsLabel.text = "Age restrictions: Missing"
        }
        
        popularityLabel.text = "Popularity: \(movie.popularity)"
        averageScoreLabel.text = "Average score: \(movie.voteAverage)"
        scoreNumberLabel.text = "Number of votes: \(movie.voteCount)"
        
        overviewLabel.text = movie.overview
    }
    
    private func getMovieGenre(from movieGenres: [Int]) -> String {
        var result = "Genre: "
        
        for movieGenreID in movieGenres {
            for genre in genresArray {
                if movieGenreID == genre.id {
                    result.append("\(genre.name), ")
                }
            }
        }
        
        return String(result.dropLast(2))
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
            
            activityIndicator.centerYAnchor.constraint(equalTo: backdropImageView.centerYAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: backdropImageView.centerXAnchor),
            
            backdropImageView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            backdropImageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            backdropImageView.widthAnchor.constraint(equalToConstant: view.frame.width),
            backdropImageView.heightAnchor.constraint(equalTo: backdropImageView.widthAnchor, multiplier: 0.6),

            titleLabel.topAnchor.constraint(equalTo: backdropImageView.bottomAnchor, constant: 15),
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
