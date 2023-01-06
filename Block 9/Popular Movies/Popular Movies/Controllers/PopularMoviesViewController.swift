//
//  PopularMoviesViewController.swift
//  Popular Movies
//
//  Created by Паша Хоренко on 06.01.2023.
//

import UIKit
import Alamofire

class PopularMoviesViewController: UIViewController {
    
    private let itemsPerRow: CGFloat = 2
    private let sectionInserts = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    
    private let movieCellID = "MovieCollectionViewCell"
    private let apiKey = "5596b19dd1f5e2efb7f5a6e4cf3431f8"
    
    private var trendsURL: String {
        "https://api.themoviedb.org/3/trending/movie/week?api_key=\(apiKey)"
    }
    private var genresURL: String {
        "https://api.themoviedb.org/3/genre/movie/list?api_key=\(apiKey)&language=en-US"
    }
    
    private var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private var moviesArray: [Result] = []
    private var genresArray: [Genre] = []
    
    // MARK: Life Сycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        
        AF.request(trendsURL)
            .validate()
            .responseDecodable(of: Trends.self) { (response) in
                guard let movies = response.value?.results else { return }
                self.moviesArray = movies
                
                self.collectionView.reloadData()
            }
        
        AF.request(genresURL)
            .validate()
            .responseDecodable(of: Genres.self) { (response) in
                guard let genres = response.value?.genres else { return }
                self.genresArray = genres
            }
    }
    
    // MARK: - Settings
    private func setupViews() {
        self.title = "Popular Movies"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.view.addSubview(collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        self.collectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: movieCellID)
        
        setConstraints()
    }
    
}


// MARK: - UICollectionViewDataSource
extension PopularMoviesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        moviesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: movieCellID, for: indexPath) as! MovieCollectionViewCell
        
        cell.configure(fromMovie: moviesArray[indexPath.item])
        
        return cell
    }
    
}

// MARK: - UICollectionViewDelegate
extension PopularMoviesViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailsVC = DetailsViewController()

        detailsVC.movie = moviesArray[indexPath.item]
        detailsVC.allGenresArray = genresArray

        self.navigationController?.pushViewController(detailsVC, animated: true)
//        print(indexPath)
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension PopularMoviesViewController: UICollectionViewDelegateFlowLayout {
    
    // Сell size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let paddingWidth = sectionInserts.left * (itemsPerRow + 1)
        let availableWidth = collectionView.frame.width - paddingWidth
        
        let widthPerItem = availableWidth / itemsPerRow
        let heigthPerItem = widthPerItem * 1.5
        
        return CGSize(width: widthPerItem, height: heigthPerItem)
    }
    
    // Indent the section outward
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInserts
    }
    
    // Indentation within a section
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInserts.top
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInserts.top
    }
}

//MARK: - Constraints
extension PopularMoviesViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
