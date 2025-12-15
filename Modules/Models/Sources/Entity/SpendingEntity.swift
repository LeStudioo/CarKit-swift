//
//  SpendingEntity.swift
//  Models
//
//  Created by Theo Sementa on 13/12/2025.
//

import Foundation
import SwiftData

@Model
public class SpendingEntity: EntityProtocol, Identifiable {
    
    @Attribute(.unique) public var localId: UUID = UUID()
    public var remoteId: String?
    
    public var amount: Double?
    public var date: Date
    public var type: SpendingType
    public var recurrence: RecurrenceType
    public var currencyCode: String
    
    public var name: String?
    public var service: ServiceType?
    public var literQuantity: Double?
    public var elecQuantity: Double?
    public var literUnit: String?
    
    public var vehicle: VehicleEntity
    
    public var createdAt: Date
    public var updatedAt: Date?
    
    public init(
        vehicle: VehicleEntity,
        remoteId: String? = nil,
        amount: Double? = nil,
        date: Date,
        type: SpendingType,
        recurrence: RecurrenceType,
        currencyCode: String,
        name: String? = nil,
        service: ServiceType? = nil,
        literQuantity: Double? = nil,
        elecQuantity: Double? = nil,
        literUnit: String? = nil,
        updatedAt: Date? = nil
    ) {
        self.vehicle = vehicle
        self.localId = UUID()
        self.remoteId = remoteId
        self.amount = amount
        self.date = date
        self.type = type
        self.recurrence = recurrence
        self.currencyCode = currencyCode
        self.name = name
        self.service = service
        self.literQuantity = literQuantity
        self.elecQuantity = elecQuantity
        self.literUnit = literUnit
        self.createdAt = Date()
        self.updatedAt = updatedAt
    }

}

// MARK: - Mappers
public extension SpendingEntity {
    
    func toUIModel() -> SpendingUIModel {
        return .init(
            id: localId.uuidString,
            amount: amount,
            date: date,
            recurrence: recurrence,
            type: type,
            currencyCode: currencyCode,
            name: name,
            service: service,
            literQuantity: literQuantity,
            elecQuantity: elecQuantity,
            literUnit: literUnit,
            fromVehicle: vehicle.toUIModel(),
            isLocalModel: true
        )
    }
    
}
