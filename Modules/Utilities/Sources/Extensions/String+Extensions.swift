//
//  File.swift
//  Utilities
//
//  Created by Theo Sementa on 11/12/2025.
//

import Foundation

public extension String {
    
    var isNotEmpty: Bool {
        return self.isEmpty == false
    }
    
    func toInt() -> Int {
        return Int(self) ?? 0
    }
    
    func toDouble() -> Double {
        let newVariable = NumberFormatter()
        newVariable.numberStyle = .decimal
        newVariable.locale = Locale.current
        return newVariable.number(from: self) as? Double ?? 0
    }
    
    func toDate() -> Date? {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withInternetDateTime]
        return formatter.date(from: self)
    }
    
}
