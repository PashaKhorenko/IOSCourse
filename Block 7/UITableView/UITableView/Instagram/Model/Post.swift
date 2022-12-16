//
//  Post.swift
//  UITableView
//
//  Created by Паша Хоренко on 15.12.2022.
//

import Foundation

protocol PostProtocol {
    var avatarImageName: String { get set }
    var postImageName: String { get set }
    var nikname: String { get set }
    var viewsCount: Int { get set }
    var description: String { get set }
    var countOfComments: Int { get set }
    var postedAt: String { get set }
}

struct Post: PostProtocol {
    var nikname: String
    var avatarImageName: String
    var postImageName: String
    var viewsCount: Int
    var description: String
    var countOfComments: Int
    var postedAt: String
}
