//
//  JobResponse.swift
//  PWC
//
//  Created by Andrei Tanc on 27.07.2022.
//

import Foundation

struct JobResponse: Response {
    var data: [Job]
    var paginationLinks: PaginationLinks?
    var paginationMeta: PaginationMeta?
}
