//
//  ImageLoader.swift
//  PWC
//
//  Created by Andrei Tanc on 18.07.2022.
//

import UIKit
import Alamofire
import AlamofireImage

public class ImageLoader: AssetLoader {
    public typealias Loadable = UIImageView
    public static let instance = ImageLoader()
    
    public func load(uri: URL, placeholder: UIImage? = nil, in loadable: UIImageView) {
        loadable.af.setImage(withURL: uri, placeholderImage: placeholder)
    }

    public func removeImageFromCache(with url: URL) {
        let downloader = ImageDownloader.default
        let _ = downloader.imageCache?.removeImage(for: URLRequest(url: url), withIdentifier: nil)
    }
}

extension UIImageView: AssetLoadable {
    public typealias Asset = UIImage
    
    public func apply(asset: Asset) {
        self.image = asset
    }
}
