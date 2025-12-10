//
//  SwiftUIView.swift
//  Features
//
//  Created by Theo Sementa on 10/12/2025.
//

import SwiftUI
import Models
import DesignSystem

public struct AddVehicleScreen: View {
    
    // MARK: States
    @State private var viewModel: ViewModel = .init()
    
    // MARK: Init
    public init() { }
    
    // MARK: - View
    public var body: some View {
        VStack(spacing: 0) {
            NavigationBarView( // TODO: TBL
                title: "Add vehicle",
                backButtonText: "My vehicles"
            )
            
            VStack(spacing: .standard) { // TODO: TBL
                TypePickerView(
                    title: "Motorisation",
                    selectedItem: $viewModel.motorization
                )
            }
            .padding(.large)
        }
        .fullSize(.top)
        .background(Color.Gray.veryLight)
        .ignoresSafeArea(.keyboard, edges: .bottom)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
    }
}

// MARK: - Preview
#Preview {
    AddVehicleScreen()
}
