//
//  ServiceType.swift
//  Models
//
//  Created by Theo Sementa on 10/12/2025.
//

import Foundation

public enum ServiceType: String, APIModel, CaseIterable {
    case carWash
    case oilChange
    case vacuum
    case none
    
    static public var allCases: [ServiceType] {
        return [.carWash, .oilChange, .vacuum]
    }
}
