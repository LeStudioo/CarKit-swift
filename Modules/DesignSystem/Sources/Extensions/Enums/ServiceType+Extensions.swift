//
//  File.swift
//  DesignSystem
//
//  Created by Theo Sementa on 12/12/2025.
//

import Foundation
import Models

@MainActor
extension ServiceType {
    
    public var name: String {
        switch self {
        case .carWash:
            return "service_car_wash".localized
        case .oilChange:
            return "service_oil_change".localized
        case .vacuum:
            return "service_vacuum".localized
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
