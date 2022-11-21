//
//  GetPostsResponse.swift
//  PWC
//
//  Created by Andrei Tanc on 24.08.2022.
//

import Foundation

struct GetPostsResponse: Response {
    var data: [Post]
    var paginationLinks: PaginationLinks?
    var paginationMeta: PaginationMeta?
}
