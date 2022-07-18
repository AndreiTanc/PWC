//
//  RefreshTokenProvider.swift
//  PWC
//
//  Created by Andrei Tanc on 18.07.2022.
//

import Foundation

class RefreshTokenProvider: RefreshTokenMechanismDataProvider {
    private let networking: Networking
    private var refreshProviderQueue = DispatchQueue(label: "com.hawk.refresh-token")
    private var queue = [(Bool) -> Void]() {
        didSet {
            print("Did add to refresh queue. Count: \(queue.count)")
            print("Self: \(self)")
        }
    }

    private var forceLogout: () -> Void

    init(networking: Networking, forceLogout: @escaping () -> Void) {
        self.networking = networking
        self.forceLogout = forceLogout
    }

    var authToken: String? {
        return AppUserDefaults.token
    }

    var refreshToken: String? {
        return AppUserDefaults.refreshToken
    }

    func refreshTokens(completion: @escaping (Bool) -> Void) {
        guard let token = AppUserDefaults.refreshToken else {
            print(":::::ALERT::::: Refresh token is non existent.")
            completion(false)
            return
        }

        refreshProviderQueue.sync {
            self.queue.append(completion)
        }

        guard queue.count == 1 else {
            return
        }

        let request = RefreshTokenRequest(refreshToken: token)
        networking.call(request: request, onSuccess: { [weak self] (response) in
            AppUserDefaults.token = response.token
            AppUserDefaults.refreshToken = response.refreshToken
            self?.cleanQueue(withSuccess: true)
        }) { [weak self] (error) in
            self?.cleanQueue(withSuccess: false)
            self?.forceLogout()
            print(error)
        }
    }

    func cleanQueue(withSuccess success: Bool) {
        refreshProviderQueue.sync {
            self.queue.forEach({$0(success)})
            self.queue.removeAll()
        }
    }

    func shouldBeRetried(request: URLRequest) -> Bool {
        if isRefreshToken(request: request) {return false}
        if request.url?.absoluteString.contains("login") == true {return false}
        return true
    }

    func isRefreshToken(request: URLRequest) -> Bool {
        return request.url?.absoluteString.contains(RefreshTokenRequest(refreshToken: "").method.getUri(base: "")) == true
    }

    func logOutUser() {
        forceLogout()
    }
}
