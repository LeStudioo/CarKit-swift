//
//  VehicleUIModel.swift
//  Models
//
//  Created by Theo Sementa on 10/12/2025.
//

import Foundation

public struct VehicleUIModel: Sendable, Identifiable {
    public let id: String
    public var brand: String
    public var model: String
    public var customName: String?
    public var imageUrl: String?
    public var imageData: Data?
    public var year: Int?
    public var motorization: MotorizationType
    public var isLocalModel: Bool
    
    public init(
        id: String,
        brand: String,
        model: String,
        customName: String? = nil,
        imageUrl: String? = nil,
        imageData: Data? = nil,
        year: Int? = nil,
        motorization: MotorizationType,
        isLocalModel: Bool
    ) {
        self.id = id
        self.brand = brand
        self.model = model
        self.customName = customName
        self.imageUrl = imageUrl
        self.imageData = imageData
        self.year = year
        self.motorization = motorization
        self.isLocalModel = isLocalModel
    }
}
