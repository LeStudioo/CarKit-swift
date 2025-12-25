//
//  AppStorageKey.swift
//  Preferences
//
//  Created by Theo Sementa on 25/12/2025.
//

import SwiftUI

@propertyWrapper
public struct AppStorageKey<Value>: DynamicProperty, @unchecked Sendable {
    private let key: String
    private let defaultValue: Value
    @State private var storedValue: Value
    
    public var wrappedValue: Value {
        get { storedValue }
        nonmutating set {
            storedValue = newValue
            UserDefaults.standard.set(newValue, forKey: key)
        }
    }
    
    public var projectedValue: Binding<Value> {
        Binding(
            get: { wrappedValue },
            set: { wrappedValue = $0 }
        )
    }
    
    public init(_ keyPath: KeyPath<PreferencesKeys, PreferencesKey<Value>>) {
        let prefKey = PreferencesKeys()[keyPath: keyPath]
        self.key = prefKey.key
        self.defaultValue = prefKey.defaultValue
        
        let stored = UserDefaults.standard.object(forKey: prefKey.key) as? Value
        self._storedValue = State(initialValue: stored ?? prefKey.defaultValue)
    }
    
    public func update() {
        if let newValue = UserDefaults.standard.object(forKey: key) as? Value,
           String(describing: newValue) != String(describing: storedValue) {
            storedValue = newValue
        }
    }
}
