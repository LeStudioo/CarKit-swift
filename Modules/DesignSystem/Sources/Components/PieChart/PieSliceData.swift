//
//  PieSliceData.swift
//  CustomPieChart
//
//  Created by KaayZenn on 10/08/2024.
//

import Foundation
import SwiftUI
import Models

public struct PieSliceData: Hashable, Equatable {
    public var spendingType: SpendingType
    public var value: Double
    public var color: Color

    public init(spendingType: SpendingType, value: Double, color: Color) {
        self.spendingType = spendingType
        self.value = value
        self.color = color
    }
}
