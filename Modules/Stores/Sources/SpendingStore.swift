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
    
    public var spendings: [SpendingUIModel] = []
    
    public private(set) var last6MonthsSpendingsData: [BarChartUIModel] = []
    
    public let vehicleRepo: VehicleRepository = .init()
    private let spendingRepo: SpendingRepository = .init()
    
}

public extension SpendingStore {
    
    func fetchWithPagination(page: Int) async {
        do {
            guard let currentVehicle = getCurrentVehicle() else { throw NetworkError.notFound }
            let spendings = try spendingRepo.fetchWithPagination(vehicleId: currentVehicle.localId, page: page)
            let spendingsUIModel = spendings.map { $0.toUIModel() }
            self.spendings.append(contentsOf: spendingsUIModel)
        } catch {
            
        }
    }
    
    func fetchLast6MonthsSpendingsData() {
        do {
            guard let currentVehicle = getCurrentVehicle() else { throw NetworkError.notFound }
            self.last6MonthsSpendingsData = try spendingRepo.fetchLastSpendingsData(for: currentVehicle.localId, period: .sixMonth)
        } catch {
            
        }
    }
    
    func create(body: SpendingBody) async -> SpendingUIModel? {
        do {
            guard let currentVehicle = getCurrentVehicle(), let date = body.date?.toDate() else { throw NetworkError.notFound }
            
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

// MARK: - Utils
public extension SpendingStore {
    
    func getCurrentVehicle() -> VehicleEntity? {
        @Dependency(\.vehicleStore) var vehicleStore
        return vehicleStore.currentVehicle
    }
    
    func spending(for spendingId: String) -> SpendingUIModel? {
        return self.spendings.first(where: { $0.id == spendingId })
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
