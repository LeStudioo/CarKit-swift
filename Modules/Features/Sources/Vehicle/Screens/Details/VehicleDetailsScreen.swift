//
//  SwiftUIView.swift
//  Features
//
//  Created by Theo Sementa on 12/12/2025.
//

import SwiftUI
import DesignSystem
import Navigation

public struct VehicleDetailsScreen: View {

    // MARK: States
    @State private var viewModel: ViewModel
    
    // MARK: Init
    public init(vehicleId: String) {
        self._viewModel = State(wrappedValue: .init(vehiculeId: vehicleId))
    }
    
    // MARK: - View
    public var body: some View {
        if let vehicle = viewModel.vehicle {
            VStack(spacing: .zero) {
                NavigationBarView(
                    title: vehicle.fullName,
                    subtitle: vehicle.customName
                )
                
                ScrollView {
                    VStack(spacing: .zero) {
                        Rectangle()
                            .fill(Color.clear)
                            .frame(height: viewModel.imageHeight)
                        
                        VStack(spacing: .standard) {
                            
                            NavigationButtonView(
                                route: .push,
                                destination: .spending(.create(vehicleId: vehicle.id))
                            ) {
                                Text("Add spending")
                            }
                            
                            ForEach(viewModel.spendings) { spending in
                                Text("\(spending.amount)")
                            }
                            
                            ActionButtonView(title: "Pagination") {
                                await viewModel.fetchSpendings()
                            }
                            
                            Rectangle()
                                .fill(Color.clear)
                                .frame(height: 32)
                        }
                        .padding(.standard)
                        .background {
                            UnevenRoundedRectangle(
                                topLeadingRadius: 32,
                                bottomLeadingRadius: 0,
                                bottomTrailingRadius: 0,
                                topTrailingRadius: 32,
                                style: .continuous
                            )
                            .fill(Color.Gray.veryLight)
                        }
                        .offset(y: viewModel.imageHeight == 0 ? 0 : -32)
                    }
                }
                .scrollIndicators(.hidden)
                .scrollContentBackground(.hidden)
                .background(backgroundWithImage)
            }
            .background(Color.Gray.veryLight)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .task {
                await viewModel.fetchSpendings()
            }
        }
    }
}

// MARK: - Subviews
extension VehicleDetailsScreen {
    
    private var backgroundWithImage: some View {
        VStack(spacing: .zero) {
            if let imageLocal = viewModel.vehicle?.imageData, let uiImage = UIImage(data: imageLocal) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
                    .overlay(alignment: .bottom) {
                        UnevenRoundedRectangle(
                            topLeadingRadius: .huge,
                            bottomLeadingRadius: 0,
                            bottomTrailingRadius: 0,
                            topTrailingRadius: .huge,
                            style: .continuous
                        )
                        .fill(Color.Gray.veryLight)
                        .frame(height: 32)
                    }
                    .getSize { size in
                        self.viewModel.imageHeight = size.height
                    }
            }
            
            Color.Gray.veryLight
        }
    }
    
}

// MARK: - Preview
#Preview {
    VehicleDetailsScreen(vehicleId: UUID().uuidString)
}
