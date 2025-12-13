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
    case fetchAll(vehicleId: String)
    case fetchOne(vehicleId: String, spendingId: String)
    case create(vehicleId: String, body: SpendingBody)
    case update(vehicleId: String, body: SpendingBody)
    case delete(vehicleId: String, spendingId: String)
}

public extension SpendingAPIRequester {
    
    var path: String {
        switch self {
        case .fetchAll(let vehicleId):
            return NetworkPath.Spending.path(vehicleId: vehicleId)
        case .fetchOne(let vehicleId, let spendingId):
            return NetworkPath.Spending.path(vehicleId: vehicleId, spendingId: spendingId)
        case .create(let vehicleId, let body):
            return NetworkPath.Spending.path(vehicleId: vehicleId)
        case .update(let vehicleId, let body):
            return NetworkPath.Spending.path(vehicleId: vehicleId)
        case .delete(let vehicleId, let spendingId):
            return NetworkPath.Spending.path(vehicleId: vehicleId, spendingId: spendingId)
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .fetchAll, .fetchOne:
            return .GET
        case .create:
            return .POST
        case .update:
            return .PUT
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
        case .fetchAll, .fetchOne, .delete:
            return nil
        case .create(_, let body):
            return try? JSONEncoder().encode(body)
        case .update(_, let body):
            return try? JSONEncoder().encode(body)
        }
    }
    
}
