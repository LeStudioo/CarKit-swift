//
//  MileageEntity.swift
//  Models
//
//  Created by Theo Sementa on 13/12/2025.
//

import Foundation
import SwiftData

@Model
public class MileageEntity: EntityProtocol, Identifiable {
    
    @Attribute(.unique) public var localId: UUID = UUID()
    public var remoteId: String?
    
    public var mileage: Int
    public var date: Date
    public var isSetupEntry: Bool?
    
    public var vehicule: VehicleEntity
    
    public var createdAt: Date
    public var updatedAt: Date?
    
    public init(
        vehicule: VehicleEntity,
        remoteId: String? = nil,
        mileage: Int,
        date: Date,
        isSetupEntry: Bool? = nil,
        updatedAt: Date? = nil
    ) {
        self.localId = UUID()
        self.vehicule = vehicule
        self.remoteId = remoteId
        self.mileage = mileage
        self.date = date
        self.isSetupEntry = isSetupEntry
        self.createdAt = Date()
        self.updatedAt = updatedAt
    }

}
