//
//  File.swift
//  Utilities
//
//  Created by Theo Sementa on 25/12/2025.
//

import Foundation

public extension Locale {
    
    var isFrench: Bool {
        return Self.current.language.languageCode == .french
    }
    
}
