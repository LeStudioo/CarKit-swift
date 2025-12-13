//
//  File.swift
//  Stores
//
//  Created by Theo Sementa on 12/12/2025.
//

import Foundation
import Models
import Utilities
import Repositories
import Networking
import Dependencies

@MainActor @Observable
public final class SpendingStore: @unchecked Sendable {
    
    public var currentVehicle: VehicleEntity?
    
    public var spendings: [SpendingUIModel] = []
    
    public let vehicleRepo: VehicleRepository = .init()
    private let spendingRepo: SpendingRepository = .init()
    
}

public extension SpendingStore {
    
    func fetchWithPagination(page: Int) async {
        do {
            guard let currentVehicle else { throw NSError(domain: "CarKit", code: 404) } // TODO: Send real error
            let spendings = try spendingRepo.fetchWithPagination(vehicleId: currentVehicle.localId, page: page)
            let spendingsUIModel = spendings.map { $0.toUIModel() }
            self.spendings.append(contentsOf: spendingsUIModel)
        } catch {
            
        }
    }
    
    func create(body: SpendingBody) async -> SpendingUIModel? {
        do {
            guard let currentVehicle, let date = body.date?.toDate() else { throw NSError(domain: "CarKit", code: 404) } // TODO: Send real error
            
            let entity = body.toEntity(vehicle: currentVehicle, date: date)
            try spendingRepo.insert(entity)
            
            if NetworkMonitor.shared.isConnected {
//                let vehicleFromAPI = try await VehicleService.create(body: body)
//                entity.remoteId = vehicleFromAPI.id
            }
            
            return entity.toUIModel()
        } catch {
            return nil
        }
    }
    
}

// MARK: - Dependencies
extension SpendingStore: @preconcurrency DependencyKey {
    public static let liveValue = SpendingStore()
}

extension DependencyValues {
    public var spendingStore: SpendingStore {
        get { self[SpendingStore.self] }
        set { self[SpendingStore.self] = newValue }
    }
}
