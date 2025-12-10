//
//  File.swift
//  Networking
//
//  Created by Theo Sementa on 10/12/2025.
//

import Foundation
import Models

public protocol VehicleServiceProtocol {
    func fetchAll() async throws -> [VehicleAPIModel]
    func fetchOne(by carId: String) async throws -> VehicleAPIModel
    func create(body: VehicleBody) async throws -> VehicleAPIModel
    func update(for carId: String, body: VehicleBody) async throws -> VehicleAPIModel
    func delete(for carId: String) async throws
}
