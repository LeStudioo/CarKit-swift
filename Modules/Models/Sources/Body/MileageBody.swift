//
//  MileageBody.swift
//  Models
//
//  Created by Theo Sementa on 13/12/2025.
//

import Foundation

public struct MileageBody: APIModel {
    public let mileage: Int?
    public let date: String?
    public let isSetupEntry: Bool?
    
    private init(
        mileage: Int? = nil,
        date: Date? = nil,
        isSetupEntry: Bool? = nil
    ) {
        self.mileage = mileage
        self.date = date?.ISO8601Format()
        self.isSetupEntry = isSetupEntry
    }
}

public extension MileageBody {
    
    func create(
        mileage: Int,
        date: Date,
        isSetupEntry: Bool? = nil
    ) -> MileageBody {
        return .init(
            mileage: mileage,
            date: date,
            isSetupEntry: isSetupEntry
        )
    }
    
    func update(
        mileage: Int? = nil,
        date: Date? = nil,
        isSetupEntry: Bool? = nil
    ) -> MileageBody {
        return .init(
            mileage: mileage,
            date: date,
            isSetupEntry: isSetupEntry
        )
    }
    
}
