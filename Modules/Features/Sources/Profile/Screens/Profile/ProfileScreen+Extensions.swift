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
        
        @ObservationIgnored
        @AppStorageKey(\.volumeRawValue) var volumeRawValue
        
        @ObservationIgnored
        @AppStorageKey(\.distanceRawValue) var distanceRawValue
        
        var volumeUnit: VolumeType = .liter
        var distanceUnit: DistanceType = .kilometers
        
    }
    
}

extension ProfileScreen.ViewModel {
    
    func setValues() {
        volumeUnit = VolumeType(rawValue: volumeRawValue) ?? .liter
        distanceUnit = DistanceType(rawValue: distanceRawValue) ?? .kilometers
    }
    
}
