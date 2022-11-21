//
//  JobDetailsViewModel.swift
//  PWC
//
//  Created by Andrei Tanc on 20.07.2022.
//

import Foundation

class JobDetailsViewModel: ViewModel {
    var job: Job
    
    init(router: Router, job: Job) {
        self.job = job
        super.init(router: router)
    }
    
    func handleOnApplyButtonPressed() {
        if AppUserDefaults.passwordToken == nil {
            goToLogin()
            return
        }
        
        goToJobApplication()
    }
    
    private func goToJobApplication() {
        router.push(
            viewController: RoutesFactory.jobApplicationViewContorller(
                router: router, job: job
            )
        )
    }
    
    private func goToLogin() {
        router.push(
            viewController: RoutesFactory.loginViewController(
                router: router,
                screenForGoingBack: .jobDetails
            )
        )
    }
}

extension JobDetailsViewModel {
    static var mock: JobDetailsViewModel {
        return .init(router: .mock, job: .init(uuid: "", title: "", description: "", applicants: 1))
    }
}
