//
//  SwiftUIView.swift
//  Features
//
//  Created by Theo Sementa on 12/12/2025.
//

import SwiftUI
import DesignSystem
import Utilities
import Models

public struct AddSpendingScreen: View {
    
    // MARK: States
    @State private var viewModel: AddSpendingScreen.ViewModel
    
    // MARK: Environments
    @Environment(\.dismiss) private var dismiss
    
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
                onCancel: { viewModel.onCancel(dismiss: dismiss) }
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
                        stepTwoView
                    }
                }
                .padding(.large)
            }
            .scrollIndicators(.hidden)
            .scrollDismissesKeyboard(.interactively)
            
            ActionButtonView(
                title: viewModel.actionButtonTitle,
                isFullWidth: true
            ) {
                if viewModel.isStepTwo == false {
                    viewModel.isStepTwo = true
                } else {
//                    await viewModel.createVehicle(dismiss: dismiss)
                }
            }
            .padding(.large)
        }
        .animation(.smooth, value: viewModel.isStepTwo)
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
                placeholder: viewModel.randomAmountPlaceholder,
                type: .decimalPad,
                unit: UserCurrency.symbol
            )
        )
        
        DatePickerView(selectedDate: $viewModel.date)
    }
    
    @ViewBuilder
    private var stepTwoView: some View {
        TagsSectionView( // TODO: TBL
            title: "Type",
            items: viewModel.spendingTypeTags,
            selectedItem: $viewModel.selectedSpendingTag
        )
        
        switch viewModel.selectedSpendingType {
        case .vehiclePart:
            EmptyView()
        case .service:
            TagsSectionView( // TODO: TBL
                title: "Service",
                items: viewModel.serviceTypeTags,
                selectedItem: $viewModel.selectedServiceTag
            )
        case .fuel:
            EmptyView()
        case .insurance:
            EmptyView()
        case .subscription:
            EmptyView()
        case .accessories:
            EmptyView()
        case .sparePart:
            EmptyView()
        case .other:
            EmptyView()
        case .none:
            EmptyView()
        }
    }
    
}

// MARK: - Preview
#Preview {
    AddSpendingScreen(vehicleId: UUID().uuidString)
}
