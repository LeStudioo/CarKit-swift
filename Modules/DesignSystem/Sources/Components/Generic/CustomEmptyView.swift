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
    private let action: (() -> Void)?

    // MARK: Init
    public init(
        image: ImageType,
        title: String,
        message: String,
        action: (() -> Void)? = nil
    ) {
        self.image = image
        self.title = title
        self.message = message
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

            if let action {

            }
//            ActionButtonView(
//                config: .init(
//                    title: "creation_add_car".localized,
//                    icon: "iconCar",
//                    style: .primary,
//                    isFill: false
//                )
//            ) { router.push(.car(.create)) }
        }
        .fullSize()
    }
}

// MARK: - Preview
#Preview {
    CustomEmptyView(
        image: .illuCar,
        title: "No car found",
        message: "Add a car now for complete tracking! Keep an eye on maintenance, costs, and performance"
    )
}
