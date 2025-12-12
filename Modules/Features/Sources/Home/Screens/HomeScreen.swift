//
//  SwiftUIView.swift
//  Features
//
//  Created by Theo Sementa on 10/12/2025.
//

import SwiftUI
import Navigation
import DesignSystem
import Vehicle

public struct HomeScreen: View {
    
    // MARK: States
    @State private var viewModel: ViewModel = .init()
    
    // MARK: Environments
    @EnvironmentObject private var router: Router<AppDestination>
    
    // MARK: Init
    public init() { }
    
    // MARK: - View
    public var body: some View {
        VStack(spacing: .zero) {
            NavigationBarView(title: "CarKit") { }
            
            myVehiclesHeaderView
                .padding(.horizontal, .large)
                .padding(.top, .large)
            
            if viewModel.hasVehicles {
                VStack(spacing: .standard) {
                    ForEach(viewModel.vehicleStore.vehicles) { vehicle in
                        NavigationButtonView(
                            route: .push,
                            destination: .vehicle(.detail(vehicleId: vehicle.id))
                        ) {
                            VehicleRowView(vehicle: vehicle)
                        }
                    }
                    
                    ActionButtonView(
                        title: "home_button_add_vehicle".localized,
                        icon: .iconCar,
                        isFullWidth: true,
                        style: .clear,
                        action: { router.push(.vehicle(.create)) }
                    )
                }
                .padding(.horizontal, .large)
                .padding(.top, .standard)
            } else {
                CustomEmptyView(
                    image: .illuCar,
                    title: "home_empty_title".localized,
                    message: "home_empty_message".localized,
                    actionButtonTitle: "home_empty_button".localized,
                    actionButtonIcon: .iconCar,
                    action: { router.push(.vehicle(.create)) }
                )
                .padding(.horizontal, .large)
            }
        }
        .fullSize(.top)
        .background(Color.Gray.veryLight)
        .task {
            await viewModel.vehicleStore.fetchAll()
        }
    }
}

// MARK: - Subviews
extension HomeScreen {
    
    private var myVehiclesHeaderView: some View {
        Text("home_my_vehicle_header".localized)
            .customFont(.Text.Medium.bold, color: .Gray.veryDark)
            .fullWidth(.leading)
    }
    
}

// MARK: - Preview
#Preview {
    HomeScreen()
}
