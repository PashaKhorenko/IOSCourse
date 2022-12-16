//
//  InstagramViewController.swift
//  UITableView
//
//  Created by Паша Хоренко on 15.12.2022.
//

import UIKit

class InstagramViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    // Mock data
    private let postsArray: [PostProtocol] = [
        Post(nikname: "Apple", avatarImageName: "AppleLogo", postImageName: "swift", viewsCount: 5912, description: "Swift is a general-purpose, multi-paradigm, compiled programming language developed by Apple Inc. and the open-source community. First released in 2014.", countOfComments: 1084, postedAt: "Published 3 days ago."),
        Post(nikname: "landrover", avatarImageName: "LandRoverLogo", postImageName: "RangeRover", viewsCount: 492, description: "Range Rover SV Carmel Edition - homage to the Carmel Coast, California.", countOfComments: 251, postedAt: "Published 2 minutes ago."),
        Post(nikname: "CatMeme", avatarImageName: "CatMemeLogo", postImageName: "meme", viewsCount: 4013, description: "😬", countOfComments: 1390, postedAt: "Published 5 hours ago.")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        
        let nib = UINib(nibName: "InstaPostTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "InstaPostTableViewCell")
        
    }
    
}

// MARK: - UITableViewDataSource

extension InstagramViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        postsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "InstaPostTableViewCell") as? InstaPostTableViewCell else { return UITableViewCell() }
        
        let post = postsArray[indexPath.row]
        cell.configure(for: post)
        
        cell.selectionStyle = .none
        
        return cell
    }
    
}
