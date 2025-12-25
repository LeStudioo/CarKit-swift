//
//  File.swift
//  Features
//
//  Created by Theo Sementa on 25/12/2025.
//

import Foundation
import Preferences
import Models

extension ProfileScreen {
    
    @Observable
    final class ViewModel {
        
        var volumeUnit: VolumeType = .liter
        var distanceUnit: DistanceType = .kilometers
        
    }
    
}

extension ProfileScreen.ViewModel {
    
    func setValues() {
        @AppStorageKey(\.volumeRawValue) var volumeRawValue
        @AppStorageKey(\.distanceRawValue) var distanceRawValue
        
        volumeUnit = VolumeType(rawValue: volumeRawValue) ?? .liter
        distanceUnit = DistanceType(rawValue: distanceRawValue) ?? .kilometers
    }
    
}
