//
//  BarChartUIModel.swift
//  Models
//
//  Created by Theo Sementa on 13/12/2025.
//

import Foundation

public struct BarChartUIModel: Identifiable {
    public let id: UUID = UUID()
    public var date: Date
    public var value: Double

    public init(date: Date, value: Double) {
        self.date = date
        self.value = value
    }
}

public extension Array where Element == BarChartUIModel {

    var average: Int {
        guard !self.isEmpty else { return 0 }
        let numberOfZeros = self.filter { $0.value == 0 }.count
        let numberOfValues = self.count - numberOfZeros

        guard numberOfValues > 0 else { return 0 }

        let total = self.reduce(0) { $0 + $1.value }
        return Int(total) / numberOfValues
    }

}
