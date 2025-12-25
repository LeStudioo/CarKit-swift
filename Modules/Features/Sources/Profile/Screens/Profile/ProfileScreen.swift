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
            NavigationBarView( // TODO: TBL
                title: "Profile".localized,
                backButtonText: "Home".localized
            )
            
            ScrollView {
                VStack(spacing: .large) {
                    NavigationButtonView(
                        route: .push,
                        destination: .profile(.currencies)
                    ) {
                        VStack(alignment: .leading, spacing: .small) {
                            Text("Currency") // TODO: TBL
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
                        title: "Volume unit", // TODO: TBL
                        selectedItem: $viewModel.volumeUnit
                    )
                    
                    TypePickerView(
                        title: "Distance unit", // TODO: TBL
                        selectedItem: $viewModel.distanceUnit
                    )
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
