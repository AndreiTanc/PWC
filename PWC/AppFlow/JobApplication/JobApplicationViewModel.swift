//
//  JobApplicationViewModel.swift
//  PWC
//
//  Created by Andrei Tanc on 20.07.2022.
//

import Foundation

class JobApplicationViewModel: ViewModel {
    var job: Job
    
    @Published var name: String = ""
    @Published var surname: String = ""
    @Published var email: String = ""
    @Published var phone: String = ""
    
    init(router: Router, job: Job) {
        self.job = job
        super.init(router: router)
    }
    
    func handleOnUploadCVButtonPressed() {
        
    }
}

extension JobApplicationViewModel {
    static var mock: JobApplicationViewModel {
        return .init(router: .mock, job: .init(uuid: "", title: "", description: "", applicants: 2))
    }
}
