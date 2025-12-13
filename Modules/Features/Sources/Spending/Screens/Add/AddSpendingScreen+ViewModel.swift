//
//  File.swift
//  Features
//
//  Created by Theo Sementa on 12/12/2025.
//

import Foundation
import Models
import Stores
import SwiftUI

extension AddSpendingScreen {
    
    @Observable @MainActor
    final class ViewModel {
        
        // MARK: Dependencies
        var vehicleId: String?
        
        @ObservationIgnored
        @Dependency(\.vehicleStore) private var vehicleStore
        
        // MARK: Variables
        var amount: String = ""
        var date: Date = Date()
        var spendingName: String = ""
        var fuelAmount: String = ""
        var chargeAmount: String = ""
        
        var selectedSpendingTag: TagUIModel?
        var selectedServiceTag: TagUIModel?
        
        var isStepTwo: Bool = false
        
        // MARK: Constants
        let randomAmountPlaceholder: String = "\(Int.random(in: 50...300))"
        let spendingTypeTags = SpendingType.tags
        let serviceTypeTags = ServiceType.tags
        
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
    
    var actionButtonTitle: String { // TODO: TBL
        return isStepTwo ? "Validate" : "Next"
    }
    
    var selectedSpendingType: SpendingType {
        return selectedSpendingTag?.toSpendingType() ?? .none
    }
    
    var selectedServiceType: ServiceType {
        return selectedServiceTag?.toServiceType() ?? .none
    }
    
}

extension AddSpendingScreen.ViewModel {
    
    func onCancel(dismiss: DismissAction) {
        if isStepTwo {
            isStepTwo = false
        } else {
            dismiss()
        }
    }
    
}
