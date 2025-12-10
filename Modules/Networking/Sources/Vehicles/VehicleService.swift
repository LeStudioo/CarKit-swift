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
    
    public func fetchAll() async throws -> [VehicleAPIModel] {
        let response = try await NetworkService.sendRequest(
            apiBuilder: VehicleAPIRequester.fetchAll,
            responseModel: [VehicleAPIModel].self
        )
        return response
    }
    
    public func fetchOne(by carId: String) async throws -> VehicleAPIModel {
        let response = try await NetworkService.sendRequest(
            apiBuilder: VehicleAPIRequester.fetchOne(carId: carId),
            responseModel: VehicleAPIModel.self
        )
        return response
    }
    
    public func create(body: VehicleBody) async throws -> VehicleAPIModel {
        let response = try await NetworkService.sendRequest(
            apiBuilder: VehicleAPIRequester.create(body: body),
            responseModel: VehicleAPIModel.self
        )
        return response
    }
    
    public func update(for carId: String, body: VehicleBody) async throws -> VehicleAPIModel {
        let response = try await NetworkService.sendRequest(
            apiBuilder: VehicleAPIRequester.update(carId: carId, body: body),
            responseModel: VehicleAPIModel.self
        )
        return response
    }
    
    public func delete(for carId: String) async throws {
        try await NetworkService.sendRequest(
            apiBuilder: VehicleAPIRequester.delete(carId: carId)
        )
    }
    
    
}
