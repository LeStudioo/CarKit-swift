//
//  PreferencesKey.swift
//  Preferences
//
//  Created by Theo Sementa on 25/12/2025.
//

import Foundation

public struct PreferencesKey<Value> {
    let key: String
    let defaultValue: Value
    
    public init(
        key: String,
        defaultValue: Value
    ) {
        self.key = key
        self.defaultValue = defaultValue
    }
}
