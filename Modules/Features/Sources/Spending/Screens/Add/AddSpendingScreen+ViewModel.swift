//
//  File.swift
//  Features
//
//  Created by Theo Sementa on 12/12/2025.
//

import Foundation
import Models
import Stores

extension AddSpendingScreen {
    
    @Observable @MainActor
    final class ViewModel {
        
        // MARK: Dependencies
        var vehicleId: String? = nil
        
        @ObservationIgnored
        @Dependency(\.vehicleStore) private var vehicleStore
        
        // MARK: Variables
        var amount: String = ""
        var date: Date = Date()
        
        var isStepTwo: Bool = false
        
        // MARK: Init
        init(vehicleId: String? = nil) {
            self.vehicleId = vehicleId
        }
        
    }
    
}

// MARK: - Computed variables
extension AddSpendingScreen.ViewModel {
    
    var vehicle: VehicleUIModel? {
        return vehicleStore.fetchOne(by: vehicleId ?? "")
    }
    
    var sectionTitle: String { // TODO: TBL
        return isStepTwo ? "Specific informations" : "General informations"
    }
    
}
