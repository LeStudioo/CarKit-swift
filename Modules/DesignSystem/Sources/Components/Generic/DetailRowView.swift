//
//  File.swift
//  DesignSystem
//
//  Created by Theo Sementa on 16/12/2025.
//

import SwiftUI

public struct DetailRowView: View {

    // MARK: Dependencies
    private let text: String
    private let value: String

    // MARK: Init
    public init(
        text: String,
        value: String
    ) {
        self.text = text
        self.value = value
    }

    // MARK: - View
    public var body: some View {
        HStack(spacing: .small) {
            Text(text)
                .customFont(.Text.Small.medium, color: .Gray.mid)

            Text(value)
                .customFont(.Text.Small.bold, color: .Gray.veryDark)
                .fullWidth(.trailing)
        }
    }
}

// MARK: - Preview
#Preview {
    DetailRowView(text: "Preview", value: "Sunday 24 September 2024")
}
