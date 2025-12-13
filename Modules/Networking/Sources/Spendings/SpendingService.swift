//
//  File.swift
//  Networking
//
//  Created by Theo Sementa on 10/12/2025.
//

import Foundation
import Models
import NetworkKit

public struct SpendingService: SpendingServiceProtocol {
    
    static func fetchAll(vehicleId: String) async throws -> [SpendingAPIModel] {
        return try await NetworkService.sendRequest(
            apiBuilder: SpendingAPIRequester.fetchAll(vehicleId: vehicleId),
            responseModel: [SpendingAPIModel].self
        )
    }
    
    static func fetchOne(vehicleId: String, spendingId: String) async throws -> SpendingAPIModel {
        return try await NetworkService.sendRequest(
            apiBuilder: SpendingAPIRequester.fetchOne(vehicleId: vehicleId, spendingId: spendingId),
            responseModel: SpendingAPIModel.self
        )
    }
    
    static func create(vehicleId: String, body: SpendingBody) async throws -> SpendingAPIModel {
        return try await NetworkService.sendRequest(
            apiBuilder: SpendingAPIRequester.create(vehicleId: vehicleId, body: body),
            responseModel: SpendingAPIModel.self
        )
    }
    
    static func update(vehicleId: String, body: SpendingBody) async throws -> SpendingAPIModel {
        return try await NetworkService.sendRequest(
            apiBuilder: SpendingAPIRequester.update(vehicleId: vehicleId, body: body),
            responseModel: SpendingAPIModel.self
        )
    }
    
    static func delete(vehicleId: String, spendingId: String) async throws {
        try await NetworkService.sendRequest(
            apiBuilder: SpendingAPIRequester.delete(vehicleId: vehicleId, spendingId: spendingId)
        )
    }
        
}
