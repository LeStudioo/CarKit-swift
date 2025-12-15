//
//  GenericBarChartView.swift
//  DesignSystem
//
//  Created by Theo Sementa on 13/12/2025.
//

import SwiftUI
import Models
import Charts
import Utilities

public struct GenericBarChartView: View {

    // MARK: Dependencies
    var data: [BarChartUIModel]

    var averageValue: Int {
        guard !data.isEmpty else { return 0 }
        let numberOfZeroValues = data.filter { $0.value == 0 }.count
        let numberOfValues = data.count - numberOfZeroValues
        guard numberOfValues > 0 else { return 0 }

        let sum = data.reduce(0) { $0 + $1.value }
        return Int(sum) / numberOfValues
    }

    // MARK: Init
    public init(data: [BarChartUIModel]) {
        self.data = data
    }

    // MARK: -
    public var body: some View {
        Chart(data) { item in
            BarMark(
                x: .value("date", item.date, unit: .month),
                y: .value("value", item.value)
            )
            .foregroundStyle(item.date.isCurrentMonth ? Color.Brand.secondary : Color.Gray.light)
            .offset(x: 0, y: 0)
            .clipShape(
                UnevenRoundedRectangle(
                    topLeadingRadius: 6,
                    bottomLeadingRadius: 0,
                    bottomTrailingRadius: 0,
                    topTrailingRadius: 6,
                    style: .continuous
                )
            )

            RuleMark(y: .value("average", averageValue))
                .lineStyle(StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round, dash: [8]))
                .foregroundStyle(Color.Gray.mid)
        }
        .animation(.smooth, value: averageValue)
        .chartYAxis {
            AxisMarks { _ in
                AxisGridLine(stroke: StrokeStyle(lineWidth: 1))
                    .foregroundStyle(Color.Gray.light)
            }
        }
        .chartXAxis {
            AxisMarks(values: .stride(by: .month)) { value in
                if let date = value.as(Date.self) {
                    let month = date.formatted(.dateTime.month(.wide))
                    AxisValueLabel(centered: true) {
                        Text(month.prefix(3).capitalized)
                            .customFont(data.count > 6 ? .Text.Small.medium : .Text.ExtraSmall.medium, color: .Gray.mid)
                    }
                }
            }
        }
    }
}

// MARK: - Preview
//#Preview {
//    VStack(spacing: 32) {
//        GenericBarChart(data: BarChartData.mocksLast6Months)
//            .frame(height: 200)
//
//        GenericBarChart(data: BarChartData.mocksCurrentYear)
//            .frame(height: 200)
//    }
//    .padding()
//}
