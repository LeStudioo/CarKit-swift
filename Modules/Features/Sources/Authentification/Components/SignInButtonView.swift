//
//  SignInButtonView.swift
//  Features
//
//  Created by Theo Sementa on 24/12/2025.
//

import SwiftUI
import DesignSystem

struct SignInButtonView: View {

    // MARK: Dependencies
    var config: Configuration
    var action: () -> Void

    // MARK: Init
    init(
        config: Configuration,
        action: @escaping () -> Void
    ) {
        self.config = config
        self.action = action
    }

    // MARK: - View
    var body: some View {
        Button(action: action) {
            HStack(spacing: .medium) {
                IconView(asset: config.icon, renderingMode: .original)
                
                Text(config.title)
                    .customFont(.Text.Medium.bold, color: .Gray.veryDark)
            }
            .fullWidth()
            .padding(.horizontal, .standard)
            .padding(.vertical, .medium)
            .roundedBackground(
                color: .Base.white,
                radius: .small,
                strokeColor: .Gray.light
            )
        }
    }
}

// MARK: - Configuration
extension SignInButtonView {
    public struct Configuration {
        var icon: ImageType
        var title: String

        public init(
            icon: ImageType,
            title: String
        ) {
            self.icon = icon
            self.title = title
        }
    }
}

// MARK: - Preview
#Preview {
    SignInButtonView(
        config: .init(
            icon: .logoApple,
            title: "Sign in with Apple"
        ),
        action: { }
    )
    .padding()
}
