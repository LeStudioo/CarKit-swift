//
//  File.swift
//  Features
//
//  Created by Theo Sementa on 12/12/2025.
//

import Foundation
import Models
import Stores

extension VehicleDetailsScreen {
    
    @Observable
    final class ViewModel {
        
        let vehiculeId: String
        
        @ObservationIgnored
        @Dependency(\.vehicleStore) private var vehicleStore
        
        @ObservationIgnored
        @Dependency(\.spendingStore) var spendingStore
        
        public var spendings: [SpendingUIModel] = []
        
        var imageHeight: CGFloat = 0
        var page: Int = 0
        
        init(vehiculeId: String) {
            self.vehiculeId = vehiculeId
        }
        
    }
    
}

// MARK: - Computed variables
extension VehicleDetailsScreen.ViewModel {
    
    @MainActor
    var vehicle: VehicleUIModel? {
        return vehicleStore.fetchOne(by: vehiculeId)
    }
    
}

// MARK: - Public functions
extension VehicleDetailsScreen.ViewModel {
    
    @MainActor
    func fetchSpendings() async {
        guard let vehicle else { return }
        
        spendingStore.currentVehicle = try? spendingStore.vehicleRepo.fetchOneById(UUID(uuidString: vehicle.id) ?? UUID())
        let spendings = await spendingStore.fetchWithPagination(page: page)
        self.spendings.append(contentsOf: spendings)
        
        print("🔥 SPENDINGS : \(spendings)")
        
        page += 1
    }
    
}
