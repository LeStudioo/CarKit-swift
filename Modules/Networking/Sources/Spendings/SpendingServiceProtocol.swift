//
//  SpendingServiceProtocol.swift
//  Networking
//
//  Created by Theo Sementa on 10/12/2025.
//

import Foundation
import Models

protocol SpendingServiceProtocol {
    static func fetchAll(vehicleId: String) async throws -> [SpendingAPIModel]
    static func fetchOne(vehicleId: String, spendingId: String) async throws -> SpendingAPIModel
    static func create(vehicleId: String, body: SpendingBody) async throws -> SpendingAPIModel
    static func update(vehicleId: String, body: SpendingBody) async throws -> SpendingAPIModel
    static func delete(vehicleId: String, spendingId: String) async throws
}
