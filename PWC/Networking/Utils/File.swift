//
//  File.swift
//  PWC
//
//  Created by Andrei Tanc on 18.07.2022.
//

import UIKit

extension UIImage {
    public func uploadRequestData(compressionQuality: CGFloat = 0) -> UploadRequestData {
        guard let data = self.jpegData(compressionQuality: compressionQuality) else {
            fatalError("Couldn't create the image data")
        }
        return UploadRequestData.image(data: data)
    }
}
