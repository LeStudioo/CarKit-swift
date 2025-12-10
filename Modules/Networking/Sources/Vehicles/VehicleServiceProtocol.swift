//
//  File.swift
//  Networking
//
//  Created by Theo Sementa on 10/12/2025.
//

import Foundation
import Models

public protocol VehicleServiceProtocol {
    static func fetchAll() async throws -> [VehicleAPIModel]
    static func fetchOne(by carId: String) async throws -> VehicleAPIModel
    static func create(body: VehicleBody) async throws -> VehicleAPIModel
    static func update(for carId: String, body: VehicleBody) async throws -> VehicleAPIModel
    static func delete(for carId: String) async throws
}
