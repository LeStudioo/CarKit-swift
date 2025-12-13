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
    public var recurrence: RecurrenceType
    public var currencyCode: String
    
    public var name: String?
    public var service: ServiceType?
    public var literQuantity: Int?
    public var elecQuantity: Int?
    public var literUnit: String?
    
    public var createdAt: Date
    public var updatedAt: Date?
    
    public init(
        remoteId: String? = nil,
        amount: Double? = nil,
        date: Date,
        recurrence: RecurrenceType,
        currencyCode: String,
        name: String? = nil,
        service: ServiceType? = nil,
        literQuantity: Int? = nil,
        elecQuantity: Int? = nil,
        literUnit: String? = nil,
        updatedAt: Date? = nil
    ) {
        self.localId = UUID()
        self.remoteId = remoteId
        self.amount = amount
        self.date = date
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
