//
//  VehicleService.swift
//  Networking
//
//  Created by Theo Sementa on 10/12/2025.
//

import Foundation
import Models
import NetworkKit

public struct VehicleService: VehicleServiceProtocol {
    
    public static func fetchAll() async throws -> [VehicleAPIModel] {
        return try await NetworkService.sendRequest(
            apiBuilder: VehicleAPIRequester.fetchAll,
            responseModel: [VehicleAPIModel].self
        )
    }
    
    public static func fetchOne(by vehicleId: String) async throws -> VehicleAPIModel {
        return try await NetworkService.sendRequest(
            apiBuilder: VehicleAPIRequester.fetchOne(vehicleId: vehicleId),
            responseModel: VehicleAPIModel.self
        )
    }
    
    public static func create(body: VehicleBody) async throws -> VehicleAPIModel {
        return try await NetworkService.sendRequest(
            apiBuilder: VehicleAPIRequester.create(body: body),
            responseModel: VehicleAPIModel.self
        )
    }
    
    public static func update(for vehicleId: String, body: VehicleBody) async throws -> VehicleAPIModel {
        return try await NetworkService.sendRequest(
            apiBuilder: VehicleAPIRequester.update(vehicleId: vehicleId, body: body),
            responseModel: VehicleAPIModel.self
        )
    }
    
    public static func delete(for vehicleId: String) async throws {
        try await NetworkService.sendRequest(
            apiBuilder: VehicleAPIRequester.delete(vehicleId: vehicleId)
        )
    }
    
}
