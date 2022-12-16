//
//  InstagramViewController.swift
//  UITableView
//
//  Created by Паша Хоренко on 15.12.2022.
//

import UIKit

class InstagramViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private let postsArray: [PostProtocol] = [
        Post(avatarImageName: "avatarImageName", postImageName: "postImageName", viewsCount: 1143, description: "description", countOfComments: 584, postedAt: "postedAt"),
        Post(avatarImageName: "avatarImageName", postImageName: "postImageName", viewsCount: 491, description: "description", countOfComments: 251, postedAt: "postedAt"),
        Post(avatarImageName: "avatarImageName", postImageName: "postImageName", viewsCount: 4013, description: "description", countOfComments: 1390, postedAt: "postedAt")
    ]
        
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.reloadData()

        let nib = UINib(nibName: "InstaPostTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "InstaPostTableViewCell")
        
    }
    
    /*
     System ImageName for buttons:
     
        ellipsis
     
        heart / hand.thumbsup
        message
        paperplane
     
        bookmark
     */

}

// MARK: - UITableViewDataSource

extension InstagramViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        postsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "InstaPostTableViewCell") as? InstaPostTableViewCell else { return UITableViewCell() }
        
        let post = postsArray[indexPath.row]
        cell.configure(with: String(post.viewsCount))
        
        return cell
    }
    
    
}

// MARK: - UITableViewDelegate

extension InstagramViewController: UITableViewDelegate {
    
}
