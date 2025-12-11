//
//  VehicleAPIModel.swift
//  Models
//
//  Created by Theo Sementa on 10/12/2025.
//

import Foundation

public struct VehicleAPIModel: APIModel {
    public let id: String
    public var brand: String
    public var model: String
    public var customName: String

    public var imageUrl: String?

    public var year: Int?
    public var motorization: String
    
    public init(
        id: String,
        brand: String,
        model: String,
        customName: String,
        imageUrl: String? = nil,
        year: Int? = nil,
        motorization: String
    ) {
        self.id = id
        self.brand = brand
        self.model = model
        self.customName = customName
        self.imageUrl = imageUrl
        self.year = year
        self.motorization = motorization
    }
}

// MARK: - Mappers
public extension VehicleAPIModel {
    
    func toUIModel() -> VehicleUIModel {
        return .init(
            id: id,
            brand: brand,
            model: model,
            customName: customName,
            imageUrl: imageUrl,
            year: year,
            motorization: MotorizationType(rawValue: motorization) ?? .none,
            isLocalModel: false
        )
    }
    
}
