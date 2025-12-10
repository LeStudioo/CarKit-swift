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
    
    func fetchAll(carId: String) async throws -> [SpendingAPIModel] {
        let response = try await NetworkService.sendRequest(
            apiBuilder: SpendingAPIRequester.fetchAll(carId: carId),
            responseModel: [SpendingAPIModel].self
        )
        return response
    }
    
    func create(carId: String, body: SpendingBody) async throws -> SpendingAPIModel {
        let response = try await NetworkService.sendRequest(
            apiBuilder: SpendingAPIRequester.create(carId: carId, body: body),
            responseModel: SpendingAPIModel.self
        )
        return response
    }
    
    func delete(spendingId: String) async throws {
        try await NetworkService.sendRequest(
            apiBuilder: SpendingAPIRequester.delete(spendingId: spendingId)
        )
    }
    
}
