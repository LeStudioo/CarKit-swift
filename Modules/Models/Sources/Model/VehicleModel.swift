//
//  File.swift
//  Models
//
//  Created by Theo Sementa on 10/12/2025.
//

import Foundation

public struct VehicleModel: Sendable {
    public let id: String
    public var brand: String
    public var model: String
    public var imageUrl: String?
    public var year: Int?
    public var motorization: MotorizationType
    public var mileageAtStart: Int?
    
    public init(
        id: String,
        brand: String,
        model: String,
        imageUrl: String? = nil,
        year: Int? = nil,
        motorization: MotorizationType,
        mileageAtStart: Int? = nil
    ) {
        self.id = id
        self.brand = brand
        self.model = model
        self.imageUrl = imageUrl
        self.year = year
        self.motorization = motorization
        self.mileageAtStart = mileageAtStart
    }
}
