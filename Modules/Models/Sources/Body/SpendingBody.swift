//
//  File.swift
//  Models
//
//  Created by Theo Sementa on 10/12/2025.
//

import Foundation

public struct SpendingBody: APIModel {
    public let amount: Double?
    public let date: String?
    public let recurrence: String?
    public let type: String?
    public let currencyCode: String?
    
    public let name: String?
    public let service: String?
    public let literQuantity: Int?
    public let elecQuantity: Int?
    public let literUnit: String?
    
    private init(
        amount: Double? = nil,
        date: Date? = nil,
        recurrence: RecurrenceType? = nil,
        type: SpendingType? = nil,
        currencyCode: String? = nil,
        name: String? = nil,
        service: ServiceType? = nil,
        literQuantity: Int? = nil,
        elecQuantity: Int? = nil,
        literUnit: String? = nil
    ) {
        self.amount = amount
        self.date = date?.ISO8601Format()
        self.recurrence = recurrence?.rawValue
        self.type = type?.rawValue
        self.currencyCode = currencyCode
        self.name = name
        self.service = service?.rawValue
        self.literQuantity = literQuantity
        self.elecQuantity = elecQuantity
        self.literUnit = literUnit
    }
    
}

public extension SpendingBody {
    
    static func create(
        amount: Double? = nil,
        date: Date,
        recurrence: RecurrenceType,
        type: SpendingType,
        currencyCode: String,
        name: String? = nil,
        service: ServiceType? = nil,
        literQuantity: Int? = nil,
        elecQuantity: Int? = nil,
        literUnit: String? = nil
    ) -> SpendingBody {
        return .init(
            amount: amount,
            date: date,
            recurrence: recurrence,
            type: type,
            currencyCode: currencyCode,
            name: name,
            service: service,
            literQuantity: literQuantity,
            elecQuantity: elecQuantity,
            literUnit: literUnit
        )
    }
    
    static func update(
        amount: Double? = nil,
        date: Date? = nil,
        recurrence: RecurrenceType? = nil,
        type: SpendingType? = nil,
        currencyCode: String? = nil,
        name: String? = nil,
        service: ServiceType? = nil,
        literQuantity: Int? = nil,
        elecQuantity: Int? = nil,
        literUnit: String? = nil
    ) -> SpendingBody {
        return .init(
            amount: amount,
            date: date,
            recurrence: recurrence,
            type: type,
            currencyCode: currencyCode,
            name: name,
            service: service,
            literQuantity: literQuantity,
            elecQuantity: elecQuantity,
            literUnit: literUnit
        )
    }
    
}

// MARK: - Mappers
public extension SpendingBody {
    
    func toEntity(vehicle: VehicleEntity, date: Date) -> SpendingEntity {
        return .init(
            vehicle: vehicle,
            amount: amount,
            date: date,
            type: SpendingType(rawValue: type ?? "") ?? .none,
            recurrence: RecurrenceType(rawValue: recurrence ?? "") ?? .none,
            currencyCode: currencyCode ?? "",
            name: name,
            service: ServiceType(rawValue: service ?? ""),
            literQuantity: literQuantity,
            elecQuantity: elecQuantity,
            literUnit: literUnit
        )
    }
    
}
