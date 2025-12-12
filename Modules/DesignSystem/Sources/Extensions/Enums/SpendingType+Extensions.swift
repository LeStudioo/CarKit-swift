//
//  File.swift
//  DesignSystem
//
//  Created by Theo Sementa on 12/12/2025.
//

import Foundation
import Models

extension SpendingType {
    
    public var name: String { // TODO: TBL
        switch self {
        case .vehiclePart:
            "Vehicle part"
        case .service:
            "Service (carwash, ...)"
        case .fuel:
            "Essence/Charge"
        case .insurance:
            "Insurance/Taxes"
        case .subscription:
            "Subscription"
        case .accessories:
            "Accessories"
        case .sparePart:
            "Spare part"
        case .other:
            "Other"
        case .none:
            "Unknown"
        }
    }
    
    public static var tags: [TagUIModel] {
        return SpendingType.allCases.map { $0.toTag() }
    }
    
    private func toTag() -> TagUIModel {
        return .init(title: name, rawValue: rawValue)
    }
    
}
