//
//  TPieChart.swift
//  CustomPieChart
//
//  Created by KaayZenn on 10/08/2024.
//

import Foundation
import SwiftUI
import Models

public struct PieChart: View {

    // MARK: Dependencies
    var slices: [PieSliceData]
    var backgroundColor: Color

    // MARK: Configuration
    var pieSizeRatio: Double
    var holeSizeRatio: Double
    var lineWidthMultiplier: Double
    var height: CGFloat
    var isInteractive: Bool

    // MARK: States
    @State private var activeSlice: PieSliceData?

    // MARK: Computed variables
    var values: [Double] {
        return PieChart.adjustValues(slices.map(\.value))
    }

    var colors: [Color] {
        return slices.map(\.color)
    }

    var percentage: Double {
        if let activeSlice {
            return (activeSlice.value / slices.map(\.value).reduce(0, +)) * 100
        } else { return 0 }
    }

    // MARK: Init
    public init(
        slices: [PieSliceData],
        backgroundColor: Color = .init(UIColor.systemBackground),
        configuration: Configuration = .init()
    ) {
        self.slices = slices
        self.backgroundColor = backgroundColor
        self.pieSizeRatio = configuration.pieSizeRatio
        self.lineWidthMultiplier = configuration.lineWidthMultiplier
        self.holeSizeRatio = configuration.holeSizeRatio
        self.height = configuration.height
        self.isInteractive = configuration.isInteractive
    }

    // MARK: - View
    public var body: some View {
        GeometryReader { geometry in
            let adjustedValues =  PieChart.adjustValues(values)
            let total = adjustedValues.reduce(0, +)
            let angles = adjustedValues.reduce(into: [Angle(degrees: 0)]) { angles, value in
                angles.append(angles.last! + Angle(degrees: 360 * (value / total)))
            }

            let shorterSideLength = min(geometry.size.width, geometry.size.height)
            let radius = shorterSideLength * pieSizeRatio / 2
            let lineWidth = shorterSideLength * pieSizeRatio * (values.count > 1 ? lineWidthMultiplier : 0)

            ZStack {
                ForEach(0..<values.count, id: \.self) { index in
                    PieSlice(startAngle: angles[index], endAngle: angles[index + 1])
                        .fill(colors[index % colors.count])
                        .scaleEffect(self.activeSlice == slices[index] ? 1.05 : 1)
                        .animation(.spring, value: activeSlice)
                        .animation(.smooth, value: slices)
                        .overlay(
                            PieSlice(startAngle: angles[index], endAngle: angles[index + 1])
                                .stroke(backgroundColor, lineWidth: lineWidth)
                                .scaleEffect(self.activeSlice == slices[index] ? 1.05 : 1)
                        )
//                        .onTapGesture {
//                            if isInteractive {
//                                if let activeSlice, activeSlice == slices[index] {
//                                    withAnimation { self.activeSlice = nil }
//                                } else {
//                                    withAnimation { self.activeSlice = slices[index] }
//                                }
//                            }
//                        }
                } // End ForEach

                if holeSizeRatio > 0 {
                    Circle()
                        .fill(backgroundColor)
                        .frame(width: radius * 2 * holeSizeRatio, height: radius * 2 * holeSizeRatio)
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
        .aspectRatio(1, contentMode: .fit)
//        .frame(height: height)
    }
}

// MARK: - Preview
#Preview {
    PieChart(
        slices: [
            .init(spendingType: .fuel, value: 300, color: Color.red),
            .init(spendingType: .insurance, value: 200, color: Color.blue),
            .init(spendingType: .service, value: 100, color: Color.green),
            .init(spendingType: .other, value: 50, color: Color.yellow)
        ],
        configuration: .init(
            hole: 0.6
        )
    )
    .background(Color.blue.opacity(0.3))
}
