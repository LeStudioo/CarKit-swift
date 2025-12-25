//
//  File.swift
//  Networking
//
//  Created by Theo Sementa on 25/12/2025.
//

import Foundation
import KeychainKit

public extension KeychainService {
    
    static var hadRefreshToken: Bool {
        if let refreshToken = KeychainService.getItem(key: KeychainKeys.refreshToken, type: String.self) {
            return !refreshToken.isEmpty
        }
        return false
    }

}
