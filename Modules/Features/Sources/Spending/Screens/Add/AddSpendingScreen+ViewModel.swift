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
import Navigation
import Preferences

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
    
    var sectionTitle: String {
        return isStepTwo ? "add_spending_section_two_title".localized : "add_spending_section_one_title".localized
    }
    
    var actionButtonTitle: String {
        return isStepTwo ? "add_spending_section_two_button".localized : "add_spending_section_one_button".localized
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
    
    func createSpending(router: Router<AppDestination>) async {
        @AppStorageKey(\.currencyCode) var currencyCode
        
        let body: SpendingBody = .create(
            amount: amount.toDouble(),
            date: date,
            recurrence: .none,
            type: selectedSpendingType,
            currencyCode: currencyCode,
            name: spendingName.isEmpty ? nil : spendingName,
            service: selectedServiceTag?.toServiceType(),
            literQuantity: fuelAmount.toDouble(),
            elecQuantity: chargeAmount.toDouble(),
            literUnit: selectedSpendingType == .fuel ? VolumeType.userPreferenceSymbol : nil
        )
        
        let spending = await spendingStore.create(body: body)
        if spending != nil { router.dismiss() }
    }
    
}
