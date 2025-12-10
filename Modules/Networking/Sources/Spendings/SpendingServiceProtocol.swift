//
//  SpendingServiceProtocol.swift
//  Networking
//
//  Created by Theo Sementa on 10/12/2025.
//

import Foundation
import Models

protocol SpendingServiceProtocol {
    func fetchAll(carId: String) async throws -> [SpendingAPIModel]
    func create(carId: String, body: SpendingBody) async throws -> SpendingAPIModel
    func delete(spendingId: String) async throws
}
