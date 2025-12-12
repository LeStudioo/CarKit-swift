//
//  ActionButtonView.swift
//  DesignSystem
//
//  Created by Theo Sementa on 09/12/2025.
//

import SwiftUI
import Models

public struct ActionButtonView: View {

    // MARK: Dependencies
    private let title: String
    private let icon: ImageType?
    private let isFullWidth: Bool
    private let style: ActionButtonStyle
    private let action: () async -> Void

    // MARK: States
    @State private var isLoading: Bool = false

    // MARK: Init
    public init(
        title: String,
        icon: ImageType? = nil,
        isFullWidth: Bool = false,
        style: ActionButtonStyle = .fill,
        action: @escaping () async -> Void
    ) {
        self.title = title
        self.icon = icon
        self.isFullWidth = isFullWidth
        self.style = style
        self.action = action
    }

    // MARK: -
    public var body: some View {
        Button {
            Task {
                isLoading = true
                await action()
                isLoading = false
            }
        } label: {
            Group {
                if isLoading {
                    ProgressView()
                        .foregroundStyle(style.foregroundColor)
                } else {
                    HStack(spacing: .small) {
                        Text(title)
                            .customFont(.Text.Medium.bold, color: style.foregroundColor)
                            .contentTransition(.numericText())
                        
                        if let icon {
                            IconView(asset: icon, size: .medium, color: style.foregroundColor)
                        }
                    }
                }
            }
            .frame(maxWidth: isFullWidth ? .infinity : nil)
            .padding(.vertical, .medium)
            .padding(.horizontal, .standard)
            .roundedBackground(
                color: style.backgroundColor,
                radius: .small,
                strokeColor: style.strokeColor
            )
        }
        .animation(.smooth, value: isLoading)
        .disabled(isLoading)
    }
}

// MARK: - Preview
#Preview {
    VStack(spacing: .large) {
        ActionButtonView(title: "Add vehicule", icon: .iconCar) { }
        ActionButtonView(title: "Add vehicule", icon: .iconCar, style: .secondary) { }
        ActionButtonView(title: "Add vehicule", icon: .iconCar, style: .clear) { }
        ActionButtonView(title: "Add vehicule", icon: .iconCar, style: .clearError) { }
        ActionButtonView(title: "Add vehicule", icon: .iconCar, isFullWidth: true) { }
    }
    .padding(.large)
}
