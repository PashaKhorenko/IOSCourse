//
//  InstaPostTableViewCell.swift
//  UITableView
//
//  Created by Паша Хоренко on 15.12.2022.
//

import UIKit

class InstaPostTableViewCell: UITableViewCell {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var niknameLabel: UILabel!
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var viewsCountLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var countOfCommentsLabel: UILabel!
    @IBOutlet weak var postedAtLabel: UILabel!
    
    func configure(for post: PostProtocol) {
        setupViews()
        
        niknameLabel.text = post.nikname
        avatarImageView.image = UIImage(named: post.avatarImageName)
        postImageView.image = UIImage(named: post.postImageName)
        viewsCountLabel.text = "\(post.viewsCount) views"
        descriptionLabel.text = "\(post.nikname)  \(post.description)"
        countOfCommentsLabel.text = "View all \(post.countOfComments) comments"
        postedAtLabel.text = post.postedAt
    }
    
    private func setupViews() {
        avatarImageView.layer.cornerRadius = avatarImageView.frame.size.height / 2
        
        niknameLabel.font = .boldSystemFont(ofSize: 18)
        
        viewsCountLabel.font = .boldSystemFont(ofSize: 15)
        
        countOfCommentsLabel.textColor = .systemGray
        countOfCommentsLabel.font = .systemFont(ofSize: 14)
        
        descriptionLabel.font = .systemFont(ofSize: 15)
        
        postedAtLabel.textColor = .systemGray2
        postedAtLabel.font = .systemFont(ofSize: 13)
        
        postImageView.contentMode = .scaleAspectFill
        avatarImageView.contentMode = .scaleAspectFill
    }
    
}
