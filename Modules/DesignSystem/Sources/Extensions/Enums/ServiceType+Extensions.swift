//
//  File.swift
//  DesignSystem
//
//  Created by Theo Sementa on 12/12/2025.
//

import Foundation
import Models

extension ServiceType {
    
    public var name: String { // TODO: TBL
        switch self {
        case .carWash:
            return "Car wash"
        case .oilChange:
            return "Oil change"
        case .vacuum:
            return "Vacuum"
        case .none:
            return "Unknown"
        }
    }
    
    public static var tags: [TagUIModel] {
        return ServiceType.allCases.map { $0.toTag() }
    }
    
    private func toTag() -> TagUIModel {
        return .init(title: name, rawValue: rawValue)
    }
    
}
