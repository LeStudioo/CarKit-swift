//
//  SwiftUIView.swift
//  DesignSystem
//
//  Created by Theo Sementa on 25/12/2025.
//

import SwiftUI
import Utilities

public struct PieChartStatsRowView: View {

    // MARK: Dependencies
    let text: String
    let value: Int
    
    // MARK: Init
    public init(
        text: String,
        value: Int
    ) {
        self.text = text
        self.value = value
    }

    // MARK: - View
    public var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(text)
                .customFont(.Text.Small.medium, color: .Gray.dark)

            Text("\(value) \(UserCurrency.symbol)")
                .customFont(.Display.ExtraSmall.bold, color: .Gray.veryDark)
                .contentTransition(.numericText())
        }
    }
}

// MARK: - Preview
#Preview {
    PieChartStatsRowView(text: "Total spend", value: 1332)
}
