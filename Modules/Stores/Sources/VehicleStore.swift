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
    
    func fetchAll() async { // TODO: See how to sync with server
        do {
            let vehiclesFromLocal = try vehicleRepo.fetchAll()
            let vehiclesUI = vehiclesFromLocal.map { $0.toUIModel() }
            self.vehicles = vehiclesUI
        } catch {
            
        }
    }
    
    func fetchOne(by vehicleId: String) -> VehicleUIModel? {
        return vehicles.first(where: { $0.id == vehicleId })
    }
    
    func create(body: VehicleBody) async {
        do {
            let entity = body.toEntity()
            try vehicleRepo.insert(entity)
            vehicles.append(entity.toUIModel())
            
            if NetworkMonitor.shared.isConnected {
                let vehicleFromAPI = try await VehicleService.create(body: body)
                entity.remoteId = vehicleFromAPI.id
            }
        } catch {
            
        }
    }
    
    func delete(for id: String) { // TODO: See how to sync with server if no connection
        Task {
            do {
                vehicles.removeAll(where: { $0.id == id })
                
                if let uuid = UUID(uuidString: id) {
                    try? vehicleRepo.delete(by: uuid)
                }
                
                if NetworkMonitor.shared.isConnected {
                    try await VehicleService.delete(for: id)
                }
            } catch {
                
            }
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
