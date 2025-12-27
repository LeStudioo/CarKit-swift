//
//  File.swift
//  Utilities
//
//  Created by Theo Sementa on 13/12/2025.
//

import Foundation

public extension Date {
    
    var startOfYear: Date {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year], from: self)
        return calendar.date(from: components) ?? .now
    }
    
    var startOfMonth: Date {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month], from: self)
        return calendar.date(from: components) ?? .now
    }
    
    var endOfYear: Date {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year], from: self)
        let startOfYear = calendar.date(from: components) ?? .now
        return calendar.date(byAdding: .year, value: 1, to: startOfYear) ?? .now
    }
    
    var isCurrentMonth: Bool {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.month], from: self)
        let currentMonth = calendar.component(.month, from: .now)
        return components.month == currentMonth
    }
    
}
