//
//  SpendingUIModel.swift
//  Models
//
//  Created by Theo Sementa on 13/12/2025.
//

import Foundation

public struct SpendingUIModel: Identifiable {
    public let id: String
    public let amount: Double?
    public let date: Date
    public let recurrence: RecurrenceType
    public let type: SpendingType
    public let currencyCode: String

    public let name: String?
    public let service: ServiceType?
    public let literQuantity: Double?
    public let elecQuantity: Double?
    public let literUnit: String?
    
    public let fromVehicle: VehicleUIModel
    
    public let isLocalModel: Bool
    
    public init(
        id: String,
        amount: Double? = nil,
        date: Date,
        recurrence: RecurrenceType,
        type: SpendingType,
        currencyCode: String,
        name: String? = nil,
        service: ServiceType? = nil,
        literQuantity: Double? = nil,
        elecQuantity: Double? = nil,
        literUnit: String? = nil,
        fromVehicle: VehicleUIModel,
        isLocalModel: Bool
    ) {
        self.id = id
        self.amount = amount
        self.date = date
        self.recurrence = recurrence
        self.type = type
        self.currencyCode = currencyCode
        self.name = name
        self.service = service
        self.literQuantity = literQuantity
        self.elecQuantity = elecQuantity
        self.literUnit = literUnit
        self.fromVehicle = fromVehicle
        self.isLocalModel = isLocalModel
    }
}
