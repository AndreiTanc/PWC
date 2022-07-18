//
//  AssetLoader.swift
//  PWC
//
//  Created by Andrei Tanc on 18.07.2022.
//

import Foundation

public protocol AssetLoader {
    associatedtype Loadable: AssetLoadable
    func load(uri: URL, placeholder: Loadable.Asset?, in loadable: Loadable)
}

extension AssetLoader {
    public func load(uri: String, placeholder: Loadable.Asset? = nil, in loadable: Loadable){
        if let placeholder = placeholder {
            loadable.apply(asset: placeholder)
        }
        
        guard let url = URL(string: uri) else {
            print("Couldn't load image with uri: \(uri).")
            return
        }
        load(uri: url, placeholder: placeholder, in: loadable)
    }
}
