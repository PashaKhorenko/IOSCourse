//
//  PopularMoviesViewController.swift
//  Popular Movies
//
//  Created by Паша Хоренко on 06.01.2023.
//

import UIKit
import Alamofire
import RealmSwift

class PopularMoviesViewController: UIViewController {
    
    private let itemsPerRow: CGFloat = 2
    private let sectionInserts = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    
    private let movieCellID = "MovieCollectionViewCell"
    private let apiKey = "5596b19dd1f5e2efb7f5a6e4cf3431f8"
    
    private var moviesURL: String {
        "https://api.themoviedb.org/3/trending/movie/week?api_key=\(apiKey)"
    }
    private var genresURL: String {
        "https://api.themoviedb.org/3/genre/movie/list?api_key=\(apiKey)&language=en-US"
    }
    
    // MARK: UI elements
    private var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    private let refreshControl = UIRefreshControl()
    
    // MARK: Data
    private let realm = try! Realm()
    private let networkManager = NetworkManager()
    
    private var moviesArray: Results<RealmMovie>!
    
    // MARK: - Views Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        
        downloadData()
        
        moviesArray = realm.objects(RealmMovie.self)
    }
    
    // MARK: - Settings
    private func setupViews() {
        self.title = "Popular Movies"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.view.addSubview(collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        self.collectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: movieCellID)
        
        self.refreshControl.addTarget(self, action: #selector(didPullToRefresh(_:)), for: .valueChanged)
        self.collectionView.alwaysBounceVertical = true
        self.collectionView.refreshControl = refreshControl
        
        setConstraints()
    }
    
    @objc private func didPullToRefresh(_ sender: UIRefreshControl) {
        do {
            try realm.write({
                realm.deleteAll()
                print("Deleted all data from Realm database")
            })
            
            downloadData()
            
        } catch {
            print("Error deleting data: \(error.localizedDescription)")
        }
        
        refreshControl.endRefreshing()
    }
    
    // MARK: - Downloading data
    private func downloadData() {
        networkManager.downloadMovies(byPath: moviesURL, for: collectionView)
        networkManager.downloadGenres(byPath: genresURL)
    }
    
}

// MARK: - UICollectionViewDataSource
extension PopularMoviesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        moviesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: movieCellID, for: indexPath) as! MovieCollectionViewCell
        
        let movie = moviesArray[indexPath.item]
        cell.configure(fromMovie: movie, with: indexPath.item)

        return cell
    }
    
}

// MARK: - UICollectionViewDelegate
extension PopularMoviesViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailsVC = DetailsViewController()

        detailsVC.movie = moviesArray[indexPath.item]
        detailsVC.imageId = indexPath.item
        
        self.navigationController?.pushViewController(detailsVC, animated: true)
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
