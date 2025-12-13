//
//  File.swift
//  Models
//
//  Created by Theo Sementa on 10/12/2025.
//

import Foundation

public struct SpendingBody: APIModel {
    public let amount: Double?
    public let date: String
    public let recurrence: String
    public let type: String
    public let currencyCode: String
    
    public let name: String?
    public let service: String?
    public let literQuantity: Int?
    public let elecQuantity: Int?
    public let literUnit: String?
    
    public init(
        amount: Double? = nil,
        date: String,
        recurrence: RecurrenceType,
        type: SpendingType,
        currencyCode: String,
        name: String? = nil,
        service: ServiceType? = nil,
        literQuantity: Int? = nil,
        elecQuantity: Int? = nil,
        literUnit: String? = nil
    ) {
        self.amount = amount
        self.date = date
        self.recurrence = recurrence.rawValue
        self.type = type.rawValue
        self.currencyCode = currencyCode
        self.name = name
        self.service = service?.rawValue
        self.literQuantity = literQuantity
        self.elecQuantity = elecQuantity
        self.literUnit = literUnit
    }
    
}
