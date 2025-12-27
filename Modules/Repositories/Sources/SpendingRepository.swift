//
//  File.swift
//  Repositories
//
//  Created by Theo Sementa on 13/12/2025.
//

import Foundation
import Models
import Persistence
import SwiftData
import Utilities

public enum LastSpendingsPeriod {
    case sixMonth
    
    var dateToFetch: Date {
        let calendar = Calendar.current
        let now = Date.now
        let startOfCurrentMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: now))!
        
        switch self {
        case .sixMonth:
            let startOf6MonthsAgo = calendar.date(byAdding: .month, value: -5, to: startOfCurrentMonth)!
            return startOf6MonthsAgo
        }
    }
}

public final class SpendingRepository: GenericRepository<SpendingEntity> {
    
    public func fetchWithPagination(
        vehicleId: UUID,
        page: Int
    ) throws -> [SpendingEntity] {
        let pageSize: Int = 1
        
        var descriptor = FetchDescriptor<SpendingEntity>(
            predicate: #Predicate { $0.vehicle.localId == vehicleId },
            sortBy: [SortDescriptor(\.createdAt, order: .reverse)]
        )
        descriptor.fetchOffset = page * pageSize
        descriptor.fetchLimit = pageSize
        
        return try container.mainContext.fetch(descriptor)
    }
    
    public func fetchAll(for vehicleId: UUID, startDate: Date, endDate: Date) throws -> [SpendingEntity] {
        var descriptor = FetchDescriptor<SpendingEntity>(
            predicate: #Predicate {
                $0.vehicle.localId == vehicleId &&
                $0.date >= startDate &&
                $0.date <= endDate
            }
        )
        
        return try container.mainContext.fetch(descriptor)
    }
    
    public func fetchLastSpendingsData(for vehicleId: UUID, period: LastSpendingsPeriod) throws -> [BarChartUIModel] {
        let calendar = Calendar.current
        
        let dateToFetch = period.dateToFetch
        var descriptor = FetchDescriptor<SpendingEntity>(
            predicate: #Predicate {
                $0.vehicle.localId == vehicleId &&
                $0.date >= dateToFetch
            }
        )
        descriptor.propertiesToFetch = [\.amount, \.date]
        
        let results = try container.mainContext.fetch(descriptor)
        let groupedResults = Dictionary(grouping: results) { $0.date.startOfMonth }

        var barChartData: [BarChartUIModel] = []
        for value in 0..<6 {
            if let monthDate = calendar.date(byAdding: .month, value: -value, to: Date.now.startOfMonth) {
                barChartData.append(BarChartUIModel(date: monthDate, value: 0))
            }
        }

        for (date, spendings) in groupedResults {
            if let index = barChartData.firstIndex(where: { $0.date.startOfMonth == date.startOfMonth }) {
                let totalAmount = spendings.reduce(0) { $0 + ($1.amount ?? 0) }
                barChartData[index].value = totalAmount
            }
        }
        
        return barChartData.sorted { $0.date < $1.date }
    }
    
    public func fetchTotalAmount(for vehicleId: UUID) throws -> Double {
        var descriptor = FetchDescriptor<SpendingEntity>(
            predicate: #Predicate { $0.vehicle.localId == vehicleId }
        )
        descriptor.propertiesToFetch = [\.amount]
        let results = try container.mainContext.fetch(descriptor)

        return results.reduce(0) { $0 + ($1.amount ?? 0) }
    }
    
}
