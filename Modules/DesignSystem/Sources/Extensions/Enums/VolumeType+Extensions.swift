//
//  File.swift
//  DesignSystem
//
//  Created by Theo Sementa on 12/12/2025.
//

import Foundation
import Models
import Preferences

public extension VolumeType {
    
    var name: String { // TODO: TBL
        switch self {
        case .liter:
            return "volume_fuel_liter".localized
        case .gallon:
            return "volume_fuel_gallon".localized
        }
    }
    
    var symbol: String {
        switch self {
        case .liter:
            return "L"
        case .gallon:
            return "gal"
        }
    }
    
    static func symbol(for name: String) -> String? {
        return self.allCases.first(where: { $0.name == name })?.symbol
    }
    
}

public extension VolumeType {
    
    static var userPreferenceSymbol: String {
        @AppStorageKey(\.volumeRawValue) var volumeRawValue
        let volume = VolumeType(rawValue: volumeRawValue)
        return volume?.symbol ?? VolumeType.liter.rawValue
    }
    
}
