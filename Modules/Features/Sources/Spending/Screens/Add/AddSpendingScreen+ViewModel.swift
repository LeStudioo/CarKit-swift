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
        
        @ObservationIgnored
        @Dependency(\.spendingStore) private var spendingStore
        
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
    
    func createSpending(dismiss: DismissAction) async {
        let body: SpendingBody = .create(
            amount: amount.toDouble(),
            date: date,
            recurrence: .none,
            type: selectedSpendingType,
            currencyCode: "EUR", // TODO: Add user preference
            name: spendingName.isEmpty ? nil : spendingName,
            service: selectedServiceTag?.toServiceType(),
            literQuantity: fuelAmount.toDouble(),
            elecQuantity: chargeAmount.toDouble(),
            literUnit: selectedSpendingType == .fuel ? "L" : nil // TODO: Add user preference
        )
        
        let spending = await spendingStore.create(body: body)
        if spending != nil {
            dismiss()
        }
    }
    
}
