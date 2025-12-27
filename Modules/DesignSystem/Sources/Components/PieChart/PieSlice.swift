//
//  PieSlice.swift
//  CustomPieChart
//
//  Created by KaayZenn on 11/08/2024.
//

import Foundation
import SwiftUI

public struct PieSlice: Shape {
    public var startAngle: Angle
    public var endAngle: Angle

    public init(startAngle: Angle, endAngle: Angle) {
        self.startAngle = startAngle
        self.endAngle = endAngle
    }

    public func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        path.move(to: center)
        path.addArc(
            center: center,
            radius: radius,
            startAngle: startAngle - .degrees(90),
            endAngle: endAngle - .degrees(90),
            clockwise: false
        )
        path.closeSubpath()
        return path
    }
}
