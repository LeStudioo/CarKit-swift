//
//  File.swift
//  Networking
//
//  Created by Theo Sementa on 13/12/2025.
//

import Foundation
import Models

protocol MileageServiceProtocol {
    static func fetchAll(vehicleId: String) async throws -> [MileageAPIModel]
    static func fetchOne(vehicleId: String, spendingId: String) async throws -> MileageAPIModel
    static func create(vehicleId: String, body: MileageBody) async throws -> MileageAPIModel
    static func update(vehicleId: String, body: MileageBody) async throws -> MileageAPIModel
    static func delete(vehicleId: String, spendingId: String) async throws
}
