//
//  File.swift
//  Models
//
//  Created by Theo Sementa on 12/12/2025.
//

import Foundation

public struct TagUIModel: Identifiable, Equatable {
    public let id: UUID = UUID()
    public var title: String
    public var rawValue: String
    public var icon: String?
    
    public init(title: String, rawValue: String = "", icon: String? = nil) {
        self.title = title
        self.rawValue = rawValue
        self.icon = icon
    }
}
