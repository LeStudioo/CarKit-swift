//
//  NavigationBarView.swift
//  DesignSystem
//
//  Created by Theo Sementa on 09/12/2025.
//

import SwiftUI
import Models

struct NavigationBarView: View {

    // MARK: Dependencies
    private let title: String
    private let subtitle: String?
    private let hasBackButton: Bool
    private let backButtonText: String?
    private let style: NavigationBarStyle
    private let userButtonAction: (() -> Void)?

    // MARK: Environment
    @Environment(\.dismiss) private var dismiss

    // MARK: Init
    private init(
        title: String,
        subtitle: String? = nil,
        hasBackButton: Bool = true,
        backButtonText: String? = nil,
        style: NavigationBarStyle,
        userButtonAction: (() -> Void)? = nil
    ) {
        self.title = title
        self.subtitle = subtitle
        self.hasBackButton = hasBackButton
        self.backButtonText = backButtonText
        self.style = style
        self.userButtonAction = userButtonAction
    }

    // MARK: - View
    var body: some View {
        VStack(spacing: .zero) {
            HStack {
                VStack(alignment: .leading, spacing: .zero) {
                    if hasBackButton {
                        dismissButtonView
                    }

                    if style != .smallNavigation {
                        Text(title)
                            .customFont(.Display.ExtraSmall.medium, color: .Gray.veryDark)
                            .fullWidth(.leading)
                    }
                }

                if style == .smallNavigation {
                    titleWithSubtitleView

                    if hasBackButton {
                        IconView(asset: .iconArrowLeft, size: .small, color: .clear)
                    }
                }

                if style == .home {
                    userButtonView
                }
            }
            .padding(.horizontal, .standard)
            .padding(.vertical, .small)

            Rectangle()
                .fill(Color.Gray.light)
                .frame(height: 1)
        }
    }
}

extension NavigationBarView {
    
    /// home
    public init(
        title: String,
        userButtonAction: @escaping () -> Void
    ) {
        self.title = title
        self.subtitle = nil
        self.hasBackButton = false
        self.backButtonText = nil
        self.style = .home
        self.userButtonAction = userButtonAction
    }
    
    /// navigation
    public init(
        title: String,
        backButtonText: String
    ) {
        self.title = title
        self.subtitle = nil
        self.hasBackButton = true
        self.backButtonText = backButtonText
        self.style = .navigation
        self.userButtonAction = nil
    }
    
    /// small navigation
    public init(
        title: String,
        subtitle: String
    ) {
        self.title = title
        self.subtitle = subtitle
        self.hasBackButton = true
        self.backButtonText = nil
        self.style = .smallNavigation
        self.userButtonAction = nil
    }
    
}

// MARK: - Subviews
extension NavigationBarView {

    var titleWithSubtitleView: some View {
        VStack(spacing: .zero) {
            Text(title)
                .customFont(.Text.Medium.medium, color: .Gray.veryDark)
            if let subtitle {
                Text(subtitle)
                    .customFont(.Text.Small.regular, color: .Gray.mid)
            }
        }
        .fullWidth()
    }

    var userButtonView: some View {
        Button {
            if let userButtonAction {
                userButtonAction()
            }
        } label: {
            IconView(asset: .iconUser, size: .medium)
                .padding(.vertical, .small)
                .padding(.horizontal, .standard)
                .roundedBackground(color: .Gray.light, radius: .small)
        }
    }

    var dismissButtonView: some View {
        Button {
            dismiss()
        } label: {
            HStack(spacing: .small) {
                if hasBackButton {
                    IconView(asset: .iconArrowLeft, size: .small, color: .Gray.veryDark)
                }
                if let backButtonText {
                    Text(backButtonText)
                        .customFont(.Text.Medium.medium, color: .Gray.veryDark)
                }
            }
        }
    }

}

// MARK: - Preview
#Preview {
    VStack(spacing: .large) {
        NavigationBarView(
            title: "CarKit",
            userButtonAction: { }
        )
        .background(Color.blue.opacity(0.3))

        NavigationBarView(
            title: "CarKit",
            backButtonText: "Home"
        )
        .background(Color.blue.opacity(0.3))

        NavigationBarView(
            title: "Add Spending",
            subtitle: "Theo’s Car"
        )
        .background(Color.blue.opacity(0.3))
    }

}
