//
//  File.swift
//  Models
//
//  Created by Theo Sementa on 10/12/2025.
//

import Foundation

public struct SpendingBody: APIModel {
    public let amount: Double
    public let date: String
    public let recurrence: String
    public let type: String
    
    public let name: String?
    public let quantity: Int?
    public let unit: String?
    public let partId: Int?
    
    public init(
        amount: Double,
        date: String,
        recurrence: RecurrenceType,
        type: SpendingType,
        name: String? = nil,
        quantity: Int? = nil,
        unit: String? = nil,
        partId: Int? = nil
    ) {
        self.amount = amount
        self.date = date
        self.recurrence = recurrence.rawValue
        self.type = type.rawValue
        self.name = name
        self.quantity = quantity
        self.unit = unit
        self.partId = partId
    }
}
