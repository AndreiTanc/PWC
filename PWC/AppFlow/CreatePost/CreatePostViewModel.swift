//
//  CreatePostViewModel.swift
//  PWC
//
//  Created by Andrei Tanc on 22.07.2022.
//

import Foundation

class CreatePostViewModel: ViewModel {
    @Published var text: String = ""
    
    func handleOnCreatePostButtonTapped() {
        
    }
    
    func handleOnAttachmentsButtonTapped() {
        
    }
    
    func handleOnCameraButtonTapped() {
        
    }
    
    func handleOnVideoButtonTapped() {
        
    }
}

extension CreatePostViewModel {
    static var mock: CreatePostViewModel {
        return .init(router: .mock)
    }
}
