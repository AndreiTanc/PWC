//
//  WeakObject.swift
//  PWC
//
//  Created by Andrei Tanc on 18.07.2022.
//

import Foundation

class WeakObject {
    weak var interceptor: NetworkingInterceptor?
    
    init(_ interceptor: NetworkingInterceptor) {self.interceptor = interceptor}
}
