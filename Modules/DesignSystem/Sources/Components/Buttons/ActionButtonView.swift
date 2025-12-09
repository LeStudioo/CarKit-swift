//
//  ActionButtonView.swift
//  DesignSystem
//
//  Created by Theo Sementa on 09/12/2025.
//

import SwiftUI

struct ActionButtonView: View {

    // MARK: Dependencies
    private let title: String
    private let icon: ImageType?
    private let isFullWidth: Bool
    private let action: () async -> Void

    // MARK: States
    @State private var isLoading: Bool = false

    // MARK: Init
    public init(
        title: String,
        icon: ImageType?,
        isFullWidth: Bool = false,
        action: @escaping () async -> Void
    ) {
        self.title = title
        self.icon = icon
        self.isFullWidth = isFullWidth
        self.action = action
    }

    // MARK: -
    var body: some View {
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
                        .foregroundStyle(Color.white)
                } else {
                    HStack(spacing: .small) {
                        Text(title)
                            .customFont(.Text.Medium.bold, color: .Base.white)

                        if let icon {
                            IconView(asset: icon, size: .medium, color: .Base.white)
                        }
                    }
                }
            }
        }
        .frame(maxWidth: isFullWidth ? .infinity : nil)
        .padding(.vertical, .medium)
        .padding(.horizontal, .standard)
        .roundedBackground(color: .Brand.secondary, radius: .small)
        .animation(.smooth, value: isLoading)
    }
}

// MARK: - Preview
#Preview {
    VStack(spacing: .large) {
        ActionButtonView(title: "Add vehicule", icon: .iconCar) { }
        ActionButtonView(title: "Add vehicule", icon: .iconCar, isFullWidth: true) { }
    }
    .padding(.large)
}
