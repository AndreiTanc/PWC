//
//  NetworkingInterceptor.swift
//  PWC
//
//  Created by Andrei Tanc on 18.07.2022.
//

import Foundation

public protocol NetworkingInterceptor: class {
    func networking(networking: Networking, didReceiveError error: ApiError)
}
