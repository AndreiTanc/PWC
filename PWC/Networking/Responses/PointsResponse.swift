//
//  PointsResponse.swift
//  PWC
//
//  Created by Andrei Tanc on 29.08.2022.
//

import Foundation

struct PointsResponse: Response {
    var data: [PointLog]
    var paginationLinks: PaginationLinks?
    var paginationMeta: PaginationMeta?
}
