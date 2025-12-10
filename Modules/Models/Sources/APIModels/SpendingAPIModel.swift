//
//  File.swift
//  Models
//
//  Created by Theo Sementa on 10/12/2025.
//

import Foundation

public struct SpendingAPIModel: APIModel {
    public let id: String
    public var amount: String
    public var date: String
    public var recurrence: String
    public var type: String
    
    public init(
        id: String,
        amount: String,
        date: String,
        recurrence: String,
        type: String
    ) {
        self.id = id
        self.amount = amount
        self.date = date
        self.recurrence = recurrence
        self.type = type
    }
}
