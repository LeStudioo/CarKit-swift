//
//  File.swift
//  DesignSystem
//
//  Created by Theo Sementa on 25/12/2025.
//

import Foundation
import Models
import Preferences

public extension DistanceType { // TODO: TBL

    var name: String {
        switch self {
        case .kilometers:
            return "distance_kilometers".localized
        case .miles:
            return "distance_miles".localized
        }
    }

    var symbol: String {
        switch self {
        case .kilometers:
            return "km"
        case .miles:
            return "mi"
        }
    }

}

public extension DistanceType {
    
    static var userPreferenceSymbol: String {
        @AppStorageKey(\.distanceRawValue) var distanceRawValue
        let distance = DistanceType(rawValue: distanceRawValue)
        return distance?.symbol ?? DistanceType.kilometers.symbol
    }
    
}
