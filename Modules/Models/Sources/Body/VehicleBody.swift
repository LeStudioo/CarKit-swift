//
//  VehicleBody.swift
//  Models
//
//  Created by Theo Sementa on 10/12/2025.
//

import Foundation

public struct VehicleBody: APIModel {
    public var constructor: String?
    public var model: String?
    public var name: String?

    public var image: Data?

    public var year: Int?
    public var motorization: String?
    
    private init(
        constructor: String? = nil,
        model: String? = nil,
        name: String? = nil,
        image: Data? = nil,
        year: Int? = nil,
        motorization: String? = nil
    ) {
        self.constructor = constructor
        self.model = model
        self.name = name
        self.image = image
        self.year = year
        self.motorization = motorization
    }
}

public extension VehicleBody {
    
    static func create(
        constructor: String,
        model: String,
        name: String? = nil,
        image: Data? = nil,
        year: Int? = nil,
        motorization: String
    ) -> VehicleBody {
        return .init(
            constructor: constructor,
            model: model,
            name: name,
            image: image,
            year: year,
            motorization: motorization
        )
    }
    
    static func update(
        constructor: String? = nil,
        model: String? = nil,
        name: String? = nil,
        image: Data? = nil,
        year: Int? = nil,
        motorization: String? = nil
    ) -> VehicleBody {
        return .init(
            constructor: constructor,
            model: model,
            name: name,
            image: image,
            year: year,
            motorization: motorization
        )
    }
    
}
