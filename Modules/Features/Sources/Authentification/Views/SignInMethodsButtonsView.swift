//
//  SignInMethodsButtonsView.swift
//  Features
//
//  Created by Theo Sementa on 24/12/2025.
//

import SwiftUI
import Core

struct SignInMethodsButtonsView: View {

    // MARK: Constants
    private let signInWithAppleManager: SignInWithAppleService = .init()
    private let signInWithGoogleManager: SignInWithGoogleService = .init()

    // MARK: -
    var body: some View {
        VStack(spacing: 24) {
            VStack(spacing: 12) {
                SignInButtonView(
                    config: .init(
                        icon: .logoGoogle,
                        title: "login_sign_google".localized
                    )
                ) { signInWithGoogleManager.signIn() }
                
                SignInButtonView(
                    config: .init(
                        icon: .logoApple,
                        title: "login_sign_apple".localized
                    )
                ) { signInWithAppleManager.performSignIn() }
                
            }
            
            VStack(spacing: 4) {
                Text("login_condition_text".localized)
                    .customFont(.Text.Medium.medium, color: .Gray.dark)
                
                Button {
                    guard let url = URL(string: AppConstantType.appEULA) else { return }
                    UIApplication.shared.open(url)
                } label: {
                    Text("login_condition_general".localized)
                        .customFont(.Text.Medium.bold, color: .Brand.secondary)
                        .underline()
                }
            }
        }
    } // body
} // struct

// MARK: - Preview
#Preview {
    SignInMethodsButtonsView()
}
