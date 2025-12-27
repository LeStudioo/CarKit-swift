//
//  File.swift
//  Features
//
//  Created by Theo Sementa on 25/12/2025.
//

import SwiftUI
import Stores
import Dependencies
import DesignSystem
import Models

struct SpendingsChartView: View {
    
    @Dependency(\.spendingStore) private var spendingStore
    
    @State private var currentYearSpendings: [SpendingUIModel] = []
    
    @State private var totalAmount: Double = 0.0
    
    var currentMonthAmount: Double {
        return currentYearSpendings
            .filter { Calendar.current.isDate($0.date, equalTo: .now, toGranularity: .month) }
            .reduce(0) { $0 + ($1.amount ?? 0) }
    }
    
    var currentYearAmount: Double {
        return currentYearSpendings
            .reduce(0) { $0 + ($1.amount ?? 0) }
    }
    
    // MARK: -
    var body: some View {
        VStack(spacing: 24) {
            Text("spending_chart_expenses".localized)
                .customFont(.Text.Small.medium, color: .Gray.mid)
                .fullWidth(.leading)
            
//            let slices = spendingStore.spendingsForYear.toPieSliceData()
//            HStack(spacing: .standard) {
//                PieChart(
//                    slices: slices,
//                    configuration: .init(hole: 0.6)
//                )
//                
//                VStack(spacing: .tiny) {
//                    ForEach(slices, id: \.self) { slice in
//                        HStack(spacing: .tiny) {
//                            Circle()
//                                .fill(slice.color)
//                                .frame(width: 8, height: 8)
//                            
//                            Text(slice.spendingType.name.localized)
//                                .customFont(.Text.ExtraSmall.medium, color: .Gray.dark)
//                                .fullWidth(.leading)
//                        }
//                    }
//                }
//            }
            
            HStack(spacing: .large) {
                PieChartStatsRowView(
                    text: "spending_chart_total".localized,
                    value: Int(totalAmount)
                )
                
                PieChartStatsRowView(
                    text: "spending_chart_month".localized,
                    value: Int(currentMonthAmount)
                )
                
                PieChartStatsRowView(
                    text: "spending_chart_year".localized,
                    value: Int(currentYearAmount)
                )
                
                Spacer()
            }
        }
        .padding(.standard)
        .roundedBackground(
            color: .Base.white,
            radius: .large,
            strokeColor: .Gray.light
        )
        .onAppear {
            currentYearSpendings = spendingStore.fetchCurrenYearSpendings()
            totalAmount = spendingStore.fetchTotalAmountSpendings()
        }
    }
}

// MARK: - Preview
#Preview {
    SpendingsChartView()
        .padding()
}
