//
//  File.swift
//  Networking
//
//  Created by Theo Sementa on 13/12/2025.
//

import Foundation
import NetworkKit
import Models

public enum MileageAPIRequester: APIRequestBuilder {
    case fetchAll(vehicleId: String)
    case fetchOne(vehicleId: String, spendingId: String)
    case create(vehicleId: String, body: MileageBody)
    case update(vehicleId: String, body: MileageBody)
    case delete(vehicleId: String, spendingId: String)
}

public extension MileageAPIRequester {
    var path: String {
        switch self {
        case .fetchAll(let vehicleId):
            return NetworkPath.Mileage.path(vehicleId: vehicleId)
        case .fetchOne(let vehicleId, let spendingId):
            return NetworkPath.Mileage.path(vehicleId: vehicleId, spendingId: spendingId)
        case .create(let vehicleId, _):
            return NetworkPath.Mileage.path(vehicleId: vehicleId)
        case .update(let vehicleId, _):
            return NetworkPath.Mileage.path(vehicleId: vehicleId)
        case .delete(let vehicleId, let spendingId):
            return NetworkPath.Mileage.path(vehicleId: vehicleId, spendingId: spendingId)
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
