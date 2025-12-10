//
//  SwiftUIView.swift
//  Features
//
//  Created by Theo Sementa on 10/12/2025.
//

import SwiftUI
import DesignSystem

public struct HomeScreen: View {
    
    // MARK: States
    @State private var viewModel: ViewModel = .init()
    
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
                
            } else {
                CustomEmptyView(
                    image: .illuCar,
                    title: "home_empty_title".localized,
                    message: "home_empty_message".localized,
                    actionButtonTitle: "home_empty_button".localized,
                    actionButtonIcon: .iconCar) {
                        
                    }
                    .padding(.horizontal, .large)
            }
        }
        .fullSize(.top)
        .background(Color.Gray.veryLight)
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
