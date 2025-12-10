//
//  File.swift
//  Stores
//
//  Created by Theo Sementa on 10/12/2025.
//

import Foundation
import Models
import Dependencies
import Networking
import Repositories

@MainActor @Observable
public final class VehicleStore: @unchecked Sendable {
    
    public var vehicles: [VehicleUIModel] = []
    
    private let vehicleRepo: VehicleRepository = .init()
}

public extension VehicleStore {
    
    func fetchAll() async {
        do {
            if NetworkMonitor.shared.isConnected {
                let vehiclesFromAPI = try await VehicleService.fetchAll()
                let vehiclesUI = vehiclesFromAPI.map { $0.toUIModel() }
                self.vehicles = vehiclesUI
            } else {
                let vehiclesFromLocal = try vehicleRepo.fetchAll()
                let vehiclesUI = vehiclesFromLocal.map { $0.toUIModel() }
                self.vehicles = vehiclesUI
            }
        } catch {
            
        }
    }
    
}

// MARK: - Dependencies
extension VehicleStore: @preconcurrency DependencyKey {
    public static let liveValue = VehicleStore()
}

extension DependencyValues {
    public var vehicleStore: VehicleStore {
        get { self[VehicleStore.self] }
        set { self[VehicleStore.self] = newValue }
    }
}
