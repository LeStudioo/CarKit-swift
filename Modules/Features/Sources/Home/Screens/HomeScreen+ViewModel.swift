//
//  HomeScreen+ViewModel.swift
//  Features
//
//  Created by Theo Sementa on 10/12/2025.
//

import Foundation
import Stores

// MARK: - Stored variables
extension HomeScreen {
    
    @Observable @MainActor
    final class ViewModel {
        
        @ObservationIgnored
        @Dependency(\.vehicleStore) var vehicleStore
        
    }
    
}

// MARK: - Computed variables
extension HomeScreen.ViewModel {
    
    var hasVehicles: Bool {
        return vehicleStore.vehicles.isEmpty == false
    }
    
}
