//
//  VehicleAPIRequester.swift
//  Networking
//
//  Created by Theo Sementa on 10/12/2025.
//

import Foundation
import NetworkKit
import Models

public enum VehicleAPIRequester: APIRequestBuilder {
    case fetchAll
    case fetchOne(carId: String)
    case create(body: VehicleBody)
    case update(carId: String, body: VehicleBody)
    case delete(carId: String)
}

public extension VehicleAPIRequester {
    
    var path: String {
        switch self {
        case .fetchAll:
            return NetworkPath.Vehicle.path()
        case .fetchOne(let carId):
            return NetworkPath.Vehicle.path(for: carId)
        case .create:
            return NetworkPath.Vehicle.path()
        case .update(let carId, _):
            return NetworkPath.Vehicle.path(for: carId)
        case .delete(let carId):
            return NetworkPath.Vehicle.path(for: carId)
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
        case .create(let body):
            return try? JSONEncoder().encode(body)
        case .update(_, let body):
            return try? JSONEncoder().encode(body)
        }
    }
    
}
