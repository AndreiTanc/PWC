//
//  AssetLoadable.swift
//  PWC
//
//  Created by Andrei Tanc on 18.07.2022.
//

import Foundation

public protocol AssetLoadable: class {
    associatedtype Asset
    func apply(asset: Asset)
}
