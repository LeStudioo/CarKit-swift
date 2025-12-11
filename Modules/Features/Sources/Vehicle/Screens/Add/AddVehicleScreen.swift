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
            NavigationBarView( // TODO: TBL
                title: "Add vehicle",
                backButtonText: "My vehicles",
                onCancel: { viewModel.onCancel(dismiss: dismiss) }
            )
            
            ScrollView {
                VStack(spacing: .standard) { // TODO: TBL
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
            title: "Motorisation",
            selectedItem: $viewModel.motorization
        )
        
        TextFieldView(
            text: $viewModel.brand,
            config: .init(
                title: "word_constructor".localized,
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
                title: "word_model".localized,
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
                title: "word_name".localized,
                placeholder: "creation_name_placeholder".localized,
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
                title: "word_mileage_optional".localized,
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
                title: "word_year_optional".localized,
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
