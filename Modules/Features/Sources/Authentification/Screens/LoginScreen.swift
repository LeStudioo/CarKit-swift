//
//  LoginScreen.swift
//  Features
//
//  Created by Theo Sementa on 25/12/2025.
//

import SwiftUI
import Stores
import DesignSystem
import Utilities

public struct LoginScreen: View {

    // MARK: Init
    public init() { }
    
    // MARK: -
    public var body: some View {
        VStack {
            Image(asset: Locale.current.isFrench ? .illuLoginFR : .illuLoginEN)
                .resizable()
                .scaledToFit()

            Spacer()

            VStack(spacing: 48) {
                VStack(spacing: .small) {
                    Text("Join Us!".localized) // TODO: TBL
                        .customFont(.Display.ExtraSmall.medium, color: .Gray.veryDark)

                    Text("We have cookies (just kidding I’m allergic)".localized) // TODO: TBL
                        .customFont(.Text.Medium.medium, color: .Gray.mid)
                        .multilineTextAlignment(.center)
                }

                SignInMethodsButtonsView()
            }
            .padding(.standard)
        }
        .fullSize()
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - Preview
#Preview {
    LoginScreen()
}
