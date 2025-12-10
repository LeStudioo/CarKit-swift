//
//  TokenManager.swift
//  Networking
//
//  Created by Theo Sementa on 10/12/2025.
//

import Foundation
import NetworkKit
import KeychainKit
import Models

@Observable
public class TokenManager: @unchecked Sendable {
    public static let shared = TokenManager()

    public var accessToken: String = ""
}

public extension TokenManager {

    func setTokens(accessToken: String?, refreshToken: String?) {
        if let accessToken {
            self.accessToken = accessToken
        }
        if let refreshToken {
            KeychainService.setItem(key: KeychainKeys.refreshToken, data: refreshToken)
        }
    }

}
