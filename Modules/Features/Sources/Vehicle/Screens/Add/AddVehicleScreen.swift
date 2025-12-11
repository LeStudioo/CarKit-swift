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
    
    enum Field: CaseIterable {
        case name, brand, model, mileage, year
    }
    @FocusState private var field: Field?
    
    @Environment(\.dismiss) private var dismiss
    
    // MARK: Init
    public init() { }
    
    // MARK: - View
    public var body: some View {
        VStack(spacing: 0) {
            NavigationBarView(
                title: "add_vehicle_title".localized,
                backButtonText: "add_vehicle_back_button".localized,
                onCancel: { viewModel.onCancel(dismiss: dismiss) }
            )
            
            ScrollView {
                VStack(spacing: .standard) {
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
            .animation(.smooth, value: viewModel.isStepTwo)
            
            ActionButtonView(
                title: viewModel.actionButtonTitle,
                isFullWidth: true
            ) {
                if viewModel.isStepTwo == false {
                    if viewModel.isFirstStepValid { viewModel.isStepTwo = true }
                } else {
                    await viewModel.createVehicle(dismiss: dismiss)
                }
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

// MARK: - Subviews
extension AddVehicleScreen {
    
    @ViewBuilder
    private var stepOneView: some View {
        TypePickerView(
            title: "add_vehicle_field_motorization_title".localized,
            selectedItem: $viewModel.motorization
        )
        
        TextFieldView(
            text: $viewModel.brand,
            config: .init(
                title: "add_vehicle_field_brand_title".localized,
                placeholder: "Audi",
                regex: .name
            )
        )
        .focused($field, equals: .brand)
        .submitLabel(.continue)
        .onSubmit { field = .model }

        TextFieldView(
            text: $viewModel.model,
            config: .init(
                title: "add_vehicle_field_model_title".localized,
                placeholder: "A3",
                regex: .nameWithNumbers
            )
        )
        .focused($field, equals: .model)
        .submitLabel(.continue)
        .onSubmit { field = .name }

        TextFieldView(
            text: $viewModel.customName,
            config: .init(
                title: "add_vehicle_field_custom_name_title".localized,
                placeholder: "add_vehicle_field_custom_name_placeholder".localized,
                regex: .nameWithSpecialLettersAndNumbers
            )
        )
        .focused($field, equals: .name)
        .submitLabel(.done)
        .onSubmit { field = nil }
    }
    
    @ViewBuilder
    private var stepTwoView: some View {
        ImagePickerView(selectedUIImage: $viewModel.selectedUIImage)

        TextFieldView(
            text: $viewModel.mileageAtStart,
            config: .init(
                title: "add_vehicle_field_mileage_title".localized,
                placeholder: "10 000",
                type: .numberPad,
                unit: "KM"
            )
        )
        .focused($field, equals: .mileage)
        .submitLabel(.done)
        .onSubmit { field = nil }

        TextFieldView(
            text: $viewModel.year,
            config: .init(
                title: "add_vehicle_field_manufacturing_year_title".localized,
                placeholder: "2025",
                type: .numberPad
            )
        )
    }
    
}

// MARK: - Preview
#Preview {
    AddVehicleScreen()
}
