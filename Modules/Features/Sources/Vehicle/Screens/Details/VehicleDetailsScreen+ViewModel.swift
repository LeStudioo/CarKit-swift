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
        
        var imageHeight: CGFloat = 0
        
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
