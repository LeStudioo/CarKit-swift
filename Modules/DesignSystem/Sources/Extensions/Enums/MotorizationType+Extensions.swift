//
//  File.swift
//  DesignSystem
//
//  Created by Theo Sementa on 10/12/2025.
//

import Foundation
import Models

extension MotorizationType: @retroactive TypePickerItem {
    
    public var name: String {
        switch self {
        case .none:
            return "Aucune motorisation"
        case .thermal:
            return "Thermique"
        case .hybrid:
            return "Hybride"
        case .electric:
            return "Electrique"
        }
    }
    
    public static var allCases: [MotorizationType] {
        return [.thermal, .hybrid, .electric]
    }

}
