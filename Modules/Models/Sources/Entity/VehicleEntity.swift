//
//  VehicleEntity.swift
//  Models
//
//  Created by Theo Sementa on 10/12/2025.
//

import Foundation
import SwiftData

@Model
public class VehicleEntity {
    
    public var localId: UUID
    public var remoteId: String?
    
    public var brand: String
    public var model: String
    public var customName: String
    
    public var imageLocal: Data?
    
    public var year: Int?
    public var motorization: MotorizationType
    
    public var createdAt: Date
    public var updatedAt: Date?
    
    public init(
        remoteId: String? = nil,
        brand: String,
        model: String,
        customName: String,
        imageLocal: Data? = nil,
        year: Int? = nil,
        motorization: MotorizationType,
        updatedAt: Date? = nil
    ) {
        self.localId = UUID()
        self.remoteId = remoteId
        self.brand = brand
        self.model = model
        self.customName = customName
        self.imageLocal = imageLocal
        self.year = year
        self.motorization = motorization
        self.createdAt = Date()
        self.updatedAt = updatedAt
    }

}

// MARK: - Mappers
public extension VehicleEntity {
    
    func toUIModel() -> VehicleUIModel {
        return .init(
            id: localId.uuidString,
            brand: brand,
            model: model,
            customName: customName,
            imageData: imageLocal,
            year: year,
            motorization: motorization,
            isLocalModel: true
        )
    }
    
}
