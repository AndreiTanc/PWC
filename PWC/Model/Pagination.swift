//
//  Pagination.swift
//  PWC
//
//  Created by Andrei Tanc on 26.07.2022.
//

import Foundation

struct PaginationLinks: Codable {
    var prev: String?
    var first: String?
    var next: String?
    var last: String?
}

struct PaginationMeta: Codable {
    var current_page: Int
    var to: Int
    var from: Int
    var path: String
    var per_page: String
}
