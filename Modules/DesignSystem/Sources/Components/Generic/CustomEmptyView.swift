//
//  SwiftUIView.swift
//  DesignSystem
//
//  Created by Theo Sementa on 09/12/2025.
//

import SwiftUI

public struct CustomEmptyView: View {

    // MARK: Dependencies
    private let image: ImageType
    private let title: String
    private let message: String
    private let actionButtonTitle: String?
    private let actionButtonIcon: ImageType?
    private let action: (() async -> Void)?

    // MARK: Init
    public init(
        image: ImageType,
        title: String,
        message: String,
        actionButtonTitle: String? = nil,
        actionButtonIcon: ImageType? = nil,
        action: (() -> Void)? = nil
    ) {
        self.image = image
        self.title = title
        self.message = message
        self.actionButtonTitle = actionButtonTitle
        self.actionButtonIcon = actionButtonIcon
        self.action = action
    }

    // MARK: - View
    public var body: some View {
        VStack(spacing: .large) {
            VStack(spacing: .standard) {
                Image(asset: image)
                    .background(Image(asset: .backgroundMediumPattern))

                VStack(spacing: .tiny) {
                    Text(title)
                        .customFont(.Display.ExtraSmall.bold, color: .Gray.veryDark)

                    Text(message)
                        .customFont(.Text.Small.regular, color: .Gray.mid)
                        .multilineTextAlignment(.center)
                }
            }

            if let action, let actionButtonTitle {
                ActionButtonView(
                    title: actionButtonTitle,
                    icon: actionButtonIcon
                ) {
                    await action()
                }
            }
        }
        .fullSize()
    }
}

// MARK: - Preview
#Preview {
    CustomEmptyView(
        image: .illuCar,
        title: "No car found",
        message: "Add a car now for complete tracking! Keep an eye on maintenance, costs, and performance",
        actionButtonTitle: "Add vehicle",
        actionButtonIcon: .iconCar
    ) { }
}
