//
//  PreferencesKeys.swift
//  Preferences
//
//  Created by Theo Sementa on 25/12/2025.
//

import Foundation
import Models

public struct PreferencesKeys {
    public var isHapticFeedbackEnabled: PreferencesKey<Bool> {
        PreferencesKey(key: "isHapticFeedbackEnabled", defaultValue: false)
    }
    
    public var currencyRawValue: PreferencesKey<String> {
        PreferencesKey(key: "currencyRawValue", defaultValue: Locale.current.currency?.identifier ?? "")
    }
    
    public var volumeRawValue: PreferencesKey<String> {
        PreferencesKey(key: "volumeRawValue", defaultValue: VolumeType.liter.rawValue)
    }
    
    public var distanceRawValue: PreferencesKey<String> {
        PreferencesKey(key: "distanceRawValue", defaultValue: DistanceType.kilometers.rawValue)
    }
}
