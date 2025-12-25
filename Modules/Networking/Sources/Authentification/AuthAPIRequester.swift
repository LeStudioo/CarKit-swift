//
//  AuthAPIRequester.swift
//  Networking
//
//  Created by Theo Sementa on 24/12/2025.
//

import Foundation
import NetworkKit
import Models

public enum AuthAPIRequester: APIRequestBuilder {
    case apple(body: AuthBody)
    case google(body: AuthBody)
}

public extension AuthAPIRequester {
    var path: String {
        switch self {
        case .apple:
            return NetworkPath.Auth.apple
        case .google:
            return NetworkPath.Auth.google
        }
    }

    var httpMethod: HTTPMethod {
        return .POST
    }

    var parameters: [URLQueryItem]? {
        return nil
    }

    var isTokenNeeded: Bool {
        return false
    }

    var body: Data? {
        switch self {
        case .apple(let body):  return try? JSONEncoder().encode(body)
        case .google(let body): return try? JSONEncoder().encode(body)
        }
    }
}
