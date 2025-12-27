//
//  File.swift
//  DesignSystem
//
//  Created by Theo Sementa on 12/12/2025.
//

import Foundation
import Models

extension SpendingType {
    
    @MainActor
    public var name: String {
        switch self {
        case .vehiclePart:
            "spending_type_vehicle_part".localized
        case .service:
            "spending_type_service".localized
        case .fuel:
            "spending_type_fuel".localized
        case .insurance:
            "spending_type_insurance".localized
        case .subscription:
            "spending_type_subscription".localized
        case .accessories:
            "spending_type_accessories".localized
        case .sparePart:
            "spending_type_spare_part".localized
        case .other:
            "spending_type_other".localized
        case .none:
            "Unknown"
        }
    }
    
    @MainActor
    public static var tags: [TagUIModel] {
        return SpendingType.allCases.map { $0.toTag() }
    }
    
    @MainActor
    private func toTag() -> TagUIModel {
        return .init(title: name, rawValue: rawValue)
    }
    
}
