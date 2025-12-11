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
    
}
