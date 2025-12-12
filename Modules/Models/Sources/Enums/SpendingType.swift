//
//  SpendingType.swift
//  Models
//
//  Created by Theo Sementa on 10/12/2025.
//

import Foundation

public enum SpendingType: String, APIModel, CaseIterable {
    case vehiclePart
    case service
    case fuel
    case insurance
    case subscription
    case accessories
    case sparePart
    case other
    case none
    
    static public var allCases: [SpendingType] {
        return [.vehiclePart, .service, .fuel, .insurance, .subscription, .accessories, .sparePart, .other]
    }
}
