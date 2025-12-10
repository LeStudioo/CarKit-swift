//
//  File.swift
//  Stores
//
//  Created by Theo Sementa on 10/12/2025.
//

import Foundation
import Models
import Dependencies

@Observable
public final class VehicleStore: @unchecked Sendable {
    
    public var vehicles: [VehicleModel] = []
    
}

// MARK: - Dependencies
extension VehicleStore: DependencyKey {
    public static let liveValue = VehicleStore()
}

extension DependencyValues {
    public var vehicleStore: VehicleStore {
        get { self[VehicleStore.self] }
        set { self[VehicleStore.self] = newValue }
    }
}
