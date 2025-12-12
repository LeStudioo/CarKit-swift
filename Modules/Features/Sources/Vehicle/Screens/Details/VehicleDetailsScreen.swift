//
//  SwiftUIView.swift
//  Features
//
//  Created by Theo Sementa on 12/12/2025.
//

import SwiftUI
import Navigation

public struct VehicleDetailsScreen: View {
    
    let vehicleId: String
    
    public init(vehicleId: String) {
        self.vehicleId = vehicleId
    }
    
    public var body: some View {
        NavigationButtonView(
            route: .push,
            destination: .spending(.create(vehicleId: vehicleId))
        ) {
            Text("Add spending")
        }
    }
    
}

#Preview {
    VehicleDetailsScreen(vehicleId: UUID().uuidString)
}
