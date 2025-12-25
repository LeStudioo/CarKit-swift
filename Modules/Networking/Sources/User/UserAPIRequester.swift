//
//  UserAPIRequester.swift
//  Networking
//
//  Created by Theo Sementa on 25/12/2025.
//

import Foundation
import NetworkKit
import Models

public enum UserAPIRequester: APIRequestBuilder {
    case me // swiftlint:disable:this identifier_name
    case refreshToken(refreshToken: String)
}

public extension UserAPIRequester {
    var path: String {
        switch self {
        case .me:
            return NetworkPath.User.me
        case .refreshToken(let refreshToken):
            return NetworkPath.User.refreshToken(refreshToken: refreshToken)
        }
    }

    var httpMethod: HTTPMethod {
        switch self {
        case .me:
            return .GET
        case .refreshToken:
            return .GET
        }
    }

    var parameters: [URLQueryItem]? { return nil }

    var isTokenNeeded: Bool {
        switch self {
        case .me:
            return true
        case .refreshToken:
            return false
        }
    }

    var body: Data? {
        return nil
    }

}
