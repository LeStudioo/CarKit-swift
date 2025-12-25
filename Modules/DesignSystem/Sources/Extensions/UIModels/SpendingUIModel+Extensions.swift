//
//  File.swift
//  DesignSystem
//
//  Created by Theo Sementa on 15/12/2025.
//

import Foundation
import Models

public extension SpendingUIModel {
    
    var title: String {
        switch self.type {
            
//        case .vehiclePart:
//            return carPart?.name ?? ""
            
        case .service:
            return self.service?.name ?? ""
            
        case .fuel:
            var quantityToDisplay: String = ""
            let volumeUnit = VolumeType.userPreferenceSymbol
            let motorization = self.fromVehicle.motorization
            
            if (motorization == .hybrid || motorization == .thermal) && literQuantity != 0 {
                quantityToDisplay = (self.literQuantity?.toString(maxDigits: 1) ?? "") + " \(volumeUnit)"
            }
            
            if !quantityToDisplay.isEmpty && motorization != .thermal {
                quantityToDisplay += " | "
            }
            
            if (motorization == .electric || motorization == .hybrid) && elecQuantity != 0 {
                quantityToDisplay += (elecQuantity?.toString(maxDigits: 1) ?? "") + " kwh"
            }
            
            return quantityToDisplay
            
        case .insurance, .subscription, .accessories, .sparePart, .other:
            return name ?? ""
            
        default:
            return ""
            
        }
    }
    
    var subtitle: String {
        return self.type.name.localized
    }
    
}
