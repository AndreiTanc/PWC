//
//  JobsRequest.swift
//  PWC
//
//  Created by Andrei Tanc on 27.07.2022.
//

import Foundation

class JobsRequest: JWTRequest<JobResponse> {
    public override var method: ApiMethod {
        return .get("/api/v1/open/jobs")
    }
}
