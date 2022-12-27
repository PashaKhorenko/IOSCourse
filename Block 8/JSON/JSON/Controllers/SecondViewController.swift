//
//  SecondViewController.swift
//  JSON
//
//  Created by Паша Хоренко on 26.12.2022.
//

import UIKit
import Alamofire

class SecondViewController: UIViewController {
    
    private let itemsPerRow: CGFloat = 3
    private let sectionInserts = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    
    private let apiKey = "5596b19dd1f5e2efb7f5a6e4cf3431f8"
    
    private var trendsURL: String {
        "https://api.themoviedb.org/3/trending/movie/week?api_key=\(apiKey)"
    }
    private var genresURL: String {
        "https://api.themoviedb.org/3/genre/movie/list?api_key=\(apiKey)&language=en-US"
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var moviesArray: [Result] = []
    private var genresArray: [Genre] = []
    
    // MARK: Life Сycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.register(UINib(nibName: "MovieCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MovieCollectionViewCell")
        
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
    
}


// MARK: - UICollectionViewDataSource
extension SecondViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        moviesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCollectionViewCell", for: indexPath) as! MovieCollectionViewCell
        
        cell.configure(fromMovie: moviesArray[indexPath.item])
        
        return cell
    }
    
}

// MARK: - UICollectionViewDelegate
extension SecondViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let detailsVC = storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController else { return }
        
        detailsVC.movie = moviesArray[indexPath.item]
        detailsVC.allGenresArray = genresArray
        
        self.navigationController?.pushViewController(detailsVC, animated: true)
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension SecondViewController: UICollectionViewDelegateFlowLayout {
    
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
