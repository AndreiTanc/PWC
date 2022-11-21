//
//  ArticleReponse.swift
//  PWC
//
//  Created by Andrei Tanc on 26.07.2022.
//

import Foundation

struct ArticlesReponse: Response {
    var data: [Article]
    var paginationLinks: PaginationLinks?
    var paginationMeta: PaginationMeta?
}

struct ArticleReponse: Response {
    var data: Article
}
