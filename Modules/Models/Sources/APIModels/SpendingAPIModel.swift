//
//  File.swift
//  Models
//
//  Created by Theo Sementa on 10/12/2025.
//

import Foundation

public struct SpendingAPIModel: APIModel {
    public let id: String
    
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
        id: String,
        amount: Double? = nil,
        date: String,
        recurrence: String,
        type: String,
        currencyCode: String,
        name: String? = nil,
        service: String? = nil,
        literQuantity: Int? = nil,
        elecQuantity: Int? = nil,
        literUnit: String? = nil
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
    }
}
