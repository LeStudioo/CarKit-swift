//
//  AppDestination+Extensions.swift
//  CarKit
//
//  Created by Theo Sementa on 10/12/2025.
//

import Foundation
import Navigation
import SwiftUI
import Vehicle

extension AppDestination {
    
    @ViewBuilder
    static func content(for destination: AppDestination) -> some View {
        switch destination {
        case .vehicle(let vehicleDestination):
            vehicleView(vehicleDestination)
        }
    }
    
}

extension AppDestination {
    
    @ViewBuilder
    static private func vehicleView(_ destination: VehicleDestination) -> some View {
        switch destination {
        case .create:
            AddVehicleScreen()
        }
    }
    
}
