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
import Navigation
import Preferences

public struct AddSpendingScreen: View {
    
    // MARK: States
    @State private var viewModel: AddSpendingScreen.ViewModel
    
    // MARK: Environments
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var router: Router<AppDestination>
    
    // MARK: Init
    public init(vehicleId: String) {
        self._viewModel = State(wrappedValue: .init(vehicleId: vehicleId))
    }
    
    // MARK: - View
    public var body: some View {
        VStack(spacing: 0) {
            NavigationBarView(
                title: "add_spending_title".localized,
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
                    await viewModel.createSpending(router: router)
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
    private var stepOneView: some View {
        TextFieldView(
            text: $viewModel.amount,
            config: .init(
                title: "add_spending_field_amount".localized,
                placeholder: viewModel.randomAmountPlaceholder,
                type: .decimalPad,
                unit: UserCurrency.symbol
            )
        )
        
        DatePickerView(selectedDate: $viewModel.date)
    }
    
    @ViewBuilder
    private var stepTwoView: some View {
        TagsSectionView(
            title: "add_spending_field_type".localized,
            items: viewModel.spendingTypeTags,
            selectedItem: $viewModel.selectedSpendingTag
        )
        
        switch viewModel.selectedSpendingType {
            
        case .vehiclePart:
            EmptyView()
            
        case .service:
            TagsSectionView(
                title: "add_spending_field_service".localized,
                items: viewModel.serviceTypeTags,
                selectedItem: $viewModel.selectedServiceTag
            )
            
        case .fuel:
            fuelFields
            
        case .insurance, .subscription, .accessories, .sparePart, .other:
            TextFieldView(
                text: $viewModel.spendingName,
                config: .init(
                    title: "add_spending_field_name".localized,
                    placeholder: "add_spending_field_name_placeholder".localized
                )
            )
            
        case .none:
            EmptyView()
        }
    }
    
    @ViewBuilder
    private var fuelFields: some View {
        @AppStorageKey(\.volumeRawValue) var volumeRawValue
        
        if let vehicle = viewModel.vehicle {
            let motorization = vehicle.motorization
            
            if motorization == .thermal || motorization == .hybrid {
                TextFieldView(
                    text: $viewModel.fuelAmount,
                    config: .init(
                        title: "add_spending_field_quantity".localized,
                        placeholder: "40.00",
                        type: .decimalPad,
                        unit: VolumeType.userPreferenceSymbol
                    )
                )
            }
            
            if motorization == .electric || motorization == .hybrid {
                TextFieldView(
                    text: $viewModel.chargeAmount,
                    config: .init(
                        title: "add_spending_field_quantity".localized,
                        placeholder: "40.00",
                        type: .decimalPad,
                        unit: "kwh"
                    )
                )
            }
        }
    }
    
}

// MARK: - Preview
#Preview {
    AddSpendingScreen(vehicleId: UUID().uuidString)
}
