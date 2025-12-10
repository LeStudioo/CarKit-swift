//
//  File.swift
//  Networking
//
//  Created by Theo Sementa on 10/12/2025.
//

import Foundation
import NetworkKit
import Models

public enum SpendingAPIRequester: APIRequestBuilder {
    case fetchAll(carId: String)
    case create(carId: String, body: SpendingBody)
    case delete(spendingId: String)
}

public extension SpendingAPIRequester {
    
    var path: String {
        switch self {
        case .fetchAll(let carId):
            return NetworkPath.Spending.path(for: carId)
        case .create(let carId, _):
            return NetworkPath.Spending.path(for: carId)
        case .delete(let spendingId):
            return NetworkPath.Spending.path(for: spendingId)
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .fetchAll:
            return .GET
        case .create:
            return .POST
        case .delete:
            return .DELETE
        }
    }
    
    var parameters: [URLQueryItem]? {
        return nil
    }
    
    var isTokenNeeded: Bool {
        return true
    }
    
    var body: Data? {
        switch self {
        case .fetchAll, .delete:
            return nil
        case .create(_, let body):
            return try? JSONEncoder().encode(body)
        }
    }
    
}
