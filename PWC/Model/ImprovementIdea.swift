//
//  ImprovementIdea.swift
//  PWC
//
//  Created by Andrei Tanc on 25.08.2022.
//

import Foundation

struct ImprovementIdea: Codable {
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
    var feedbacks: [String] // must change data type
    var endorsed: Bool
    var totalPeople: Int
    var endorsedPeople: Int
    var isCurrentUser: Bool
}
