//
//  File.swift
//  DesignSystem
//
//  Created by Theo Sementa on 12/12/2025.
//

import Foundation
import Models

public extension TagUIModel {
    
    func toSpendingType() -> SpendingType {
        return SpendingType(rawValue: self.rawValue) ?? .none
    }
    
    func toServiceType() -> ServiceType {
        return ServiceType(rawValue: self.rawValue) ?? .none
    }
    
}
