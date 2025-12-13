//
//  MileageAPIModel.swift
//  Models
//
//  Created by Theo Sementa on 13/12/2025.
//

import Foundation

public struct MileageAPIModel: APIModel {
    public let id: String
    public let mileage: Int
    public let date: String
    public let isSetupEntry: Bool
 
    public init(
        id: String,
        mileage: Int,
        date: String,
        isSetupEntry: Bool
    ) {
        self.id = id
        self.mileage = mileage
        self.date = date
        self.isSetupEntry = isSetupEntry
    }
}
