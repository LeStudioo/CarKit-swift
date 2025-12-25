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
//        switch self {
//        case .none:
//            return "Unknown"
//        case .thermal:
//            return "motorization_thermal".localized
//        case .hybrid:
//            return "motorization_hybrid".localized
//        case .electric:
//            return "motorization_electric".localized
//        }
        // TODO: To fix
        return ""
    }
    
    public static var allCases: [MotorizationType] {
        return [.thermal, .hybrid, .electric]
    }

}
