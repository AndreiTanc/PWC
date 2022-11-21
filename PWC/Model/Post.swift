//
//  Post.swift
//  PWC
//
//  Created by Andrei Tanc on 23.08.2022.
//

import Foundation

struct Post: Codable {
    var uuid: String
    var user: PostUser
    var category: PostCategory
    var date: String
    var title: String
    var body: String
    var link: String?
    var image: String?
    var video: String?
    var reactions: Reactions
    var comments: Int
}

enum PostCategory: String, Codable {
    case iCareAbout = "i care about"
    case helpRequest = "help request"
    case announcement = "announcements"
    case improvementIdeas = "improvement ideas"
}

struct PostUser: Codable {
    var name: String
    var avatar: String
    var jobTitle: String?
    
    private enum CodingKeys: String, CodingKey {
        case name, avatar
        case jobTitle = "job_title"
    }
}
