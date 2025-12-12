//
//  SwiftUIView.swift
//  Features
//
//  Created by Theo Sementa on 12/12/2025.
//

import SwiftUI
import DesignSystem
import Utilities

public struct AddSpendingScreen: View {
    
    // MARK: States
    @State private var viewModel: AddSpendingScreen.ViewModel
    
    // MARK: Init
    public init(vehicleId: String) {
        self._viewModel = State(wrappedValue: .init(vehicleId: vehicleId))
    }
    
    // MARK: - View
    public var body: some View {
        VStack(spacing: 0) {
            NavigationBarView( // TODO: TBL
                title: "Add Spending",
                subtitle: viewModel.vehicle?.customName ?? "",
                onCancel: {  } // viewModel.onCancel(dismiss: dismiss)
            )
            
            ScrollView {
                VStack(spacing: .standard) {
                    ProgressBarView(progress: viewModel.isStepTwo ? 1 : 0.5)
                    
                    Text(viewModel.sectionTitle)
                        .customFont(.Display.ExtraSmall.bold, color: .Gray.veryDark)
                        .contentTransition(.numericText())
                        .fullWidth(.leading)
                    
                    if viewModel.isStepTwo == false {
                        stepOneView
                    } else {
//                        stepTwoView
                    }
                }
                .padding(.large)
            }
            .scrollIndicators(.hidden)
            .scrollDismissesKeyboard(.interactively)
            .animation(.smooth, value: viewModel.isStepTwo)
            
//            ActionButtonView(
//                title: viewModel.actionButtonTitle,
//                isFullWidth: true
//            ) {
//                if viewModel.isStepTwo == false {
//                    if viewModel.isFirstStepValid { viewModel.isStepTwo = true }
//                } else {
//                    await viewModel.createVehicle(dismiss: dismiss)
//                }
//            }
//            .padding(.large)
            
        }
        .fullSize(.top)
        .background(Color.Gray.veryLight)
        .ignoresSafeArea(.keyboard, edges: .bottom)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
    }
}

// MARK: - Subviews
extension AddSpendingScreen {
    
    @ViewBuilder
    private var stepOneView: some View { // TODO: TBL
        TextFieldView(
            text: $viewModel.amount,
            config: .init(
                title: "Amount".localized,
                placeholder: "\(Int.random(in: 50...300))",
                type: .decimalPad,
                unit: UserCurrency.symbol
            )
        )
        
        DatePickerView(selectedDate: $viewModel.date)
    }
    
}

// MARK: - Preview
#Preview {
    AddSpendingScreen(vehicleId: UUID().uuidString)
}
