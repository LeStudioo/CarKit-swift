//
//  BannerStyle+Extensions.swift
//  DesignSystem
//
//  Created by Theo Sementa on 09/12/2025.
//

import Foundation
import Models
import SwiftUI

extension BannerStyle {

    var foregroundColor: Color {
        switch self {
        case .error:
            return Color.Error.secondary
        case .success:
            return Color.Success.primary
        }
    }

    var backgroundColor: Color {
        switch self {
        case .error:
            return Color.Error.light
        case .success:
            return Color.Success.light
        }
    }

}
