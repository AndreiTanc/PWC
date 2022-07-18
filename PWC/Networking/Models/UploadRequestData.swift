//
//  UploadRequestData.swift
//  PWC
//
//  Created by Andrei Tanc on 18.07.2022.
//

import Foundation
import Alamofire

public enum UploadRequestData {
    case data(Data, name: String, fileName: String, mimeType: String)
    case file(String, name: String, fileName: String, mimeType: String)
}

extension UploadRequestData {
    func appendTo(formData: MultipartFormData) {
        switch self {
        case .data(let data, name: let name, fileName: let fileName, mimeType: let mimeType):
            formData.append(data, withName: name, fileName: fileName, mimeType: mimeType)
        case .file(let path, name: let name, fileName: let fileName, mimeType: let mimeType):
            let fileURl = URL(fileURLWithPath: path)
            formData.append(fileURl, withName: name, fileName: fileName, mimeType: mimeType)
        }
    }

    public static func image(data: Data, image: String = "image", fileName: String = "image.jpeg", mimeType: String = "image/jpeg") -> UploadRequestData {
        return UploadRequestData.data(data, name: image, fileName: fileName, mimeType: mimeType)
    }
}
