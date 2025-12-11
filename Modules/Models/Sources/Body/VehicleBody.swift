//
//  VehicleBody.swift
//  Models
//
//  Created by Theo Sementa on 10/12/2025.
//

import Foundation

public struct VehicleBody: APIModel {
    public var brand: String?
    public var model: String?
    public var customName: String?

    public var imageData: Data?

    public var year: Int?
    public var motorization: String?
    
    private init(
        brand: String? = nil,
        model: String? = nil,
        customName: String? = nil,
        imageData: Data? = nil,
        year: Int? = nil,
        motorization: String? = nil
    ) {
        self.brand = brand
        self.model = model
        self.customName = customName
        self.imageData = imageData
        self.year = year
        self.motorization = motorization
    }
}

public extension VehicleBody {
    
    static func create(
        brand: String,
        model: String,
        customName: String,
        imageData: Data? = nil,
        year: Int? = nil,
        motorization: String
    ) -> VehicleBody {
        return .init(
            brand: brand,
            model: model,
            customName: customName,
            imageData: imageData,
            year: year,
            motorization: motorization
        )
    }
    
    static func update(
        brand: String? = nil,
        model: String? = nil,
        customName: String? = nil,
        imageData: Data? = nil,
        year: Int? = nil,
        motorization: String? = nil
    ) -> VehicleBody {
        return .init(
            brand: brand,
            model: model,
            customName: customName,
            imageData: imageData,
            year: year,
            motorization: motorization
        )
    }
    
}

// MARK: - Mappers
public extension VehicleBody {
    
    func toEntity() -> VehicleEntity {
        return .init(
            brand: brand ?? "",
            model: model ?? "",
            customName: customName ?? "",
            imageLocal: imageData,
            year: year,
            motorization: MotorizationType(rawValue: motorization ?? "") ?? .none
        )
    }
    
}
