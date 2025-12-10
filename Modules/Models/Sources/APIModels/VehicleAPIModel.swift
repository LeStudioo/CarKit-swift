//
//  VehicleAPIModel.swift
//  Models
//
//  Created by Theo Sementa on 10/12/2025.
//

import Foundation

public struct VehicleAPIModel: APIModel {
    public let id: String
    public var constructor: String
    public var model: String
    public var name: String?

    public var image: Data?

    public var year: Int?
    public var motorization: String
    
    public init(
        id: String,
        constructor: String,
        model: String,
        name: String? = nil,
        image: Data? = nil,
        year: Int? = nil,
        motorization: String
    ) {
        self.id = id
        self.constructor = constructor
        self.model = model
        self.name = name
        self.image = image
        self.year = year
        self.motorization = motorization
    }
}
