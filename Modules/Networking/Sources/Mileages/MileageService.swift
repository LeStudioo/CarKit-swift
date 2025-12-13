//
//  MileageService.swift
//  Networking
//
//  Created by Theo Sementa on 13/12/2025.
//

import Foundation
import NetworkKit
import Models

public struct MileageService: MileageServiceProtocol {
    
    static func fetchAll(vehicleId: String) async throws -> [MileageAPIModel] {
        return try await NetworkService.sendRequest(
            apiBuilder: MileageAPIRequester.fetchAll(vehicleId: vehicleId),
            responseModel: [MileageAPIModel].self
        )
    }
    
    static func fetchOne(vehicleId: String, spendingId: String) async throws -> MileageAPIModel {
        return try await NetworkService.sendRequest(
            apiBuilder: MileageAPIRequester.fetchOne(vehicleId: vehicleId, spendingId: spendingId),
            responseModel: MileageAPIModel.self
        )
    }
    
    static func create(vehicleId: String, body: MileageBody) async throws -> MileageAPIModel {
        return try await NetworkService.sendRequest(
            apiBuilder: MileageAPIRequester.create(vehicleId: vehicleId, body: body),
            responseModel: MileageAPIModel.self
        )
    }
    
    static func update(vehicleId: String, body: MileageBody) async throws -> MileageAPIModel {
        return try await NetworkService.sendRequest(
            apiBuilder: MileageAPIRequester.update(vehicleId: vehicleId, body: body),
            responseModel: MileageAPIModel.self
        )
    }
    
    static func delete(vehicleId: String, spendingId: String) async throws {
        try await NetworkService.sendRequest(
            apiBuilder: MileageAPIRequester.delete(vehicleId: vehicleId, spendingId: spendingId)
        )
    }
    
}
