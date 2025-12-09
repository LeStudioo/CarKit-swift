//
//  File.swift
//  DesignSystem
//
//  Created by Theo Sementa on 09/12/2025.
//

import Foundation
import SwiftUI
import Models

extension ActionButtonStyle {

    var backgroundColor: Color {
        switch self {
        case .fill:
            return .Brand.primary
        case .secondary:
            return .Gray.light
        case .clear:
            return .Base.white
        case .clearError:
            return .Base.white
        }
    }

    var foregroundColor: Color {
        switch self {
        case .fill:
            return .Base.white
        case .secondary:
            return .Base.black
        case .clear:
            return .Base.black
        case .clearError:
            return .Error.secondary
        }
    }

    var strokeColor: Color {
        switch self {
        case .fill:
            return Color.clear
        case .secondary:
            return Color.clear
        case .clear:
            return .Gray.light
        case .clearError:
            return .Gray.light
        }
    }

}
