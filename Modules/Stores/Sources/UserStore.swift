//
//  UserStore.swift
//  Stores
//
//  Created by Theo Sementa on 24/12/2025.
//

import Foundation
import Models
import Dependencies
import Networking
import KeychainKit

@MainActor @Observable
public final class UserStore: @unchecked Sendable {

    public var currentUser: UserAPIModel?

    public var isUserLogged: Bool {
        return currentUser != nil
    }
}

extension UserStore {
    
    public func refreshToken() async throws {
        @Dependency(\.userStore) var userStore
        
        if let refreshTokenStored = KeychainService.getItem(key: KeychainKeys.refreshToken, type: String.self) {
            let response = try await NetworkService.sendRequest(
                apiBuilder: UserAPIRequester.refreshToken(refreshToken: refreshTokenStored),
                responseModel: AuthResponseAPIModel.self
            )

            if response.accessToken.isNotEmpty && response.refreshToken.isNotEmpty {
                TokenManager.shared.setTokens(accessToken: response.accessToken, refreshToken: response.refreshToken)
                userStore.currentUser = response.user
            } else {
                throw NetworkError.refreshTokenFailed
            }
        } else {
            print("⚠️ Keychain EMPTY")
            userStore.currentUser = nil
            TokenManager.shared.setTokens(accessToken: "", refreshToken: "")
            throw NetworkError.refreshTokenFailed
        }
    }

}

// MARK: - Dependencies
extension UserStore: @preconcurrency DependencyKey {
    public static let liveValue = UserStore()
}

extension DependencyValues {
    public var userStore: UserStore {
        get { self[UserStore.self] }
        set { self[UserStore.self] = newValue }
    }
}
