//
//  Job.swift
//  PWC
//
//  Created by Andrei Tanc on 26.07.2022.
//

import Foundation

struct Job: Codable {
    var uuid: String
    var title: String
    var description: String
    var applicants: Int
}
