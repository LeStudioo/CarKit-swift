//
//  File.swift
//  Utilities
//
//  Created by Theo Sementa on 13/12/2025.
//

import Foundation

public extension Date {
    
    var startOfMonth: Date {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month], from: self)
        return calendar.date(from: components) ?? .now
    }
    
    var isCurrentMonth: Bool {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.month], from: self)
        let currentMonth = calendar.component(.month, from: .now)
        return components.month == currentMonth
    }
    
}
