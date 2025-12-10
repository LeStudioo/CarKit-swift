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
    
    public var constructor: String
    public var model: String
    public var name: String?
    
    public var imageUrl: String?
    public var imageLocal: Data?
    
    public var year: Int?
    public var motorization: MotorizationType
    
    public var createdAt: Date
    public var updatedAt: Date?
    public var deletedAt: Date?
    
    public init(
        remoteId: String? = nil,
        constructor: String,
        model: String,
        name: String? = nil,
        imageUrl: String? = nil,
        imageLocal: Data? = nil,
        year: Int? = nil,
        motorization: MotorizationType,
        updatedAt: Date? = nil,
        deletedAt: Date? = nil
    ) {
        self.localId = UUID()
        self.remoteId = remoteId
        self.constructor = constructor
        self.model = model
        self.name = name
        self.imageUrl = imageUrl
        self.imageLocal = imageLocal
        self.year = year
        self.motorization = motorization
        self.createdAt = Date()
        self.updatedAt = updatedAt
        self.deletedAt = deletedAt
    }

}
