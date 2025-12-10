//
//  SwiftUIView.swift
//  Features
//
//  Created by Theo Sementa on 10/12/2025.
//

import SwiftUI
import DesignSystem

struct HomeScreen: View {
    
    // MARK: States
    @State private var viewModel: ViewModel = .init()
    
    // MARK: - View
    var body: some View {
        VStack(spacing: .zero) {
            NavigationBarView(title: "CarKit") { }
            
            myVehiclesHeaderView
                .padding(.large)
            
            if viewModel.hasVehicles {
                
            } else {
                CustomEmptyView( // TODO: TBL
                    image: .illuCar,
                    title: "No car found",
                    message: "Add a car now for complete tracking! Keep an eye on maintenance, costs, and performance",
                    actionButtonTitle: "Add vehicle",
                    actionButtonIcon: .iconCar) {
                        
                    }
            }
        }
        .fullSize(.top)
        .background(Color.Gray.veryLight)
    }
    
}

// MARK: - Subviews
extension HomeScreen {
    
    var myVehiclesHeaderView: some View {
        Text("My vehicles") // TODO: TBL
            .customFont(.Text.Medium.bold, color: .Gray.veryDark)
            .fullWidth(.leading)
    }
    
}

// MARK: - Preview
#Preview {
    HomeScreen()
}
