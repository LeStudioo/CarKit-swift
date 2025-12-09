//
//  ExpenseRowView.swift
//  DesignSystem
//
//  Created by Theo Sementa on 09/12/2025.
//

import SwiftUI

public struct ExpenseRowView: View {

    // MARK: Dependencies
    private let price: Double
    private let title: String
    private let subtitle: String
    private let date: Date

    // MARK: Init
    public init(
        price: Double,
        title: String,
        subtitle: String,
        date: Date
    ) {
        self.price = price
        self.title = title
        self.subtitle = subtitle
        self.date = date
    }

    // MARK: - View
    public var body: some View {
        HStack(alignment: .top, spacing: .small) {
            VStack(alignment: .leading, spacing: .zero) {
                Text(price.toCurrency())
                    .customFont(.Text.Medium.bold, color: .Gray.veryDark)

                Text(title)
                    .customFont(.Text.Medium.medium, color: .Gray.veryDark)

                Text(subtitle)
                    .customFont(.Text.Small.medium, color: .Gray.mid)
            }
            .fullWidth(.leading)

            HStack(spacing: .tiny) {
                Text(date.formatted(date: .numeric, time: .omitted))
                    .customFont(.Text.Small.medium, color: .Gray.mid)

                IconView(asset: .iconChevronRight, size: .small, color: .Gray.mid)
            }
        }
        .padding(.standard)
        .roundedBackground(
            color: .Base.white,
            radius: .small,
            strokeColor: .Gray.light
        )
    }
}

// MARK: - Preview
#Preview {
    ExpenseRowView(
        price: 180,
        title: "Glow plug",
        subtitle: "Vehicle part",
        date: .now
    )
    .padding()
}
