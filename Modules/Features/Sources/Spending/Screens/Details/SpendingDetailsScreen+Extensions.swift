//
//  File.swift
//  Features
//
//  Created by Theo Sementa on 16/12/2025.
//

import Foundation
import Stores
import Models
import Navigation
import SwiftUI

extension SpendingDetailsScreen {
    
    @Observable
    final class ViewModel {
        
        let spendingId: String
        
        @ObservationIgnored
        @Dependency(\.spendingStore) private var spendingStore
        
        @ObservationIgnored
        @Dependency(\.vehicleStore) private var vehicleStore
        
        public init(spendingId: String) {
            self.spendingId = spendingId
        }
        
    }
    
}

// MARK: - Computed variables
extension SpendingDetailsScreen.ViewModel {
    
    var spending: SpendingUIModel? {
        return spendingStore.spending(for: spendingId)
    }
    
}

// MARK: - Public functions
extension SpendingDetailsScreen.ViewModel {
    
    func editAction(router: Router<AppDestination>, dismiss: DismissAction) {
        if let vehicle = vehicleStore.currentVehicle {
            dismiss()
            // TODO: edit spending
//            router.push(.spending(.update(carId: car.localId, spendingId: spendingId)))
        }
    }
    
}
