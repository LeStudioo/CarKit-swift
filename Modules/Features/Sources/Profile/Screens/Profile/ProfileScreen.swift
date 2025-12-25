//
//  ProfileScreen.swift
//  Features
//
//  Created by Theo Sementa on 25/12/2025.
//

import SwiftUI
import DesignSystem
import Preferences
import Navigation
import Models

public struct ProfileScreen: View {
    
    @State private var viewModel: ViewModel = .init()
    
    @AppStorageKey(\.currencyCode) private var currencyCode
    
    public init() { }
    
    // MARK: - View
    public var body: some View {
        VStack(spacing: .zero) {
            NavigationBarView(
                title: "profile_title".localized,
                backButtonText: "profile_back_button".localized
            )
            
            ScrollView {
                VStack(spacing: .large) {
                    NavigationButtonView(
                        route: .push,
                        destination: .profile(.currencies)
                    ) {
                        VStack(alignment: .leading, spacing: .small) {
                            Text("profile_field_title_currency".localized)
                                .customFont(.Text.Small.medium, color: .Gray.dark)
                            
                            HStack(spacing: .medium) {
                                Text(currencyCode)
                                    .customFont(.Text.Medium.medium, color: .Gray.veryDark)
                                    .fullWidth(.leading)
                                
                                IconView(asset: .iconChevronDown, size: .small, color: .Gray.veryDark)
                            }
                            .padding(.horizontal, .medium)
                            .padding(.vertical, .small)
                            .roundedBackground(
                                color: .Base.white,
                                radius: .small,
                                strokeColor: .Gray.light
                            )
                        }
                    }
                    
                    TypePickerView(
                        title: "profile_field_title_volume".localized,
                        selectedItem: $viewModel.volumeUnit
                    )
                    .onChange(of: viewModel.volumeUnit) { _, newValue in
                        viewModel.volumeRawValue = newValue.rawValue
                    }
                    
                    TypePickerView(
                        title: "profile_field_title_distance".localized,
                        selectedItem: $viewModel.distanceUnit
                    )
                    .onChange(of: viewModel.distanceUnit) { _, newValue in
                        viewModel.distanceRawValue = newValue.rawValue
                    }
                }
            }
            .contentMargins(.all, .large, for: .scrollContent)
        }
        .navigationBarBackButtonHidden(true)
        .onAppear {
            viewModel.setValues()
        }
    }
}

// MARK: - Preview
#Preview {
    ProfileScreen()
}
