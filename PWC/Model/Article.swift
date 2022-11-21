//
//  Article.swift
//  PWC
//
//  Created by Andrei Tanc on 26.07.2022.
//

import Foundation

struct Article: Codable {
    var uuid: String
    var title: String
    var category: ArticleCategory
    var body: String
    var cover: String
    var reactions: Reactions
    var comments: Int
}

enum ArticleCategory: String, Codable {
    case news = "News"
    case events = "Events"
}

struct Reactions: Codable {
    var like: Int
    var love: Int
    var thumbsDown: Int
    var currentUserReaction: CurrentUserReaction?
    
    private enum CodingKeys : String, CodingKey {
        case like, love, thumbsDown = "thumbs down"
        case currentUserReaction = "current_user_reaction"
    }
}

enum CurrentUserReaction: String, Codable {
    case like = "like"
    case love = "love"
    case thumbsDown = "thumbs down"
}

struct ArticleLinks: Codable {
    var thumbsDown: String?
    var comments: String?
    var url: String?
    var love: String?
    var like: String?
    
    private enum CodingKeys : String, CodingKey {
        case like, love, comments, url, thumbsDown = "thumbs-down"
    }
}
