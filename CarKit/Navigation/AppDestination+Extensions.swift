//
//  AppDestination+Extensions.swift
//  CarKit
//
//  Created by Theo Sementa on 10/12/2025.
//

import Foundation
import Navigation
import SwiftUI
import Core
import Profile
import Vehicle
import Spending

extension AppDestination {
    
    @ViewBuilder
    static func content(for destination: AppDestination) -> some View {
        switch destination {
        case .shared(let sharedDestination):
            sharedView(sharedDestination)
        case .profile(let profileDestination):
            profileView(profileDestination)
        case .vehicle(let vehicleDestination):
            vehicleView(vehicleDestination)
        case .spending(let spendingDestination):
            spendingView(spendingDestination)
        }
    }
    
}

extension AppDestination {
    
    @ViewBuilder
    static private func sharedView(_ destination: SharedDestination) -> some View {
        switch destination {
        case .sfSafari(let url):
            SFSafariScreen(url: url)
        }
    }
    
    @ViewBuilder
    static private func profileView(_ destination: ProfileDestination) -> some View {
        switch destination {
        case .home:
            ProfileScreen()
        case .currencies:
            CurrencyListScreen()
        }
    }
    
    @ViewBuilder
    static private func vehicleView(_ destination: VehicleDestination) -> some View {
        switch destination {
        case .create:
            AddVehicleScreen()
        case .detail(let vehicleId):
            VehicleDetailsScreen(vehicleId: vehicleId)
        }
    }
    
    @ViewBuilder
    static private func spendingView(_ destination: SpendingDestination) -> some View {
        switch destination {
        case .list:
            SpendingsListScreen()
        case .detail(let spendingId):
            SpendingDetailsScreen(spendingId: spendingId)
        case .create(let vehicleId):
            AddSpendingScreen(vehicleId: vehicleId)
        }
    }
    
}
