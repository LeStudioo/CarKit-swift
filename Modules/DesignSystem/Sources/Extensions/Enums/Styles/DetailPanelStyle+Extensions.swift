//
//  File.swift
//  DesignSystem
//
//  Created by Theo Sementa on 13/12/2025.
//

import Foundation
import Models

public extension DetailPanelStyle {
    
    var actionButtonTitle: String {
        switch self {
        case .mileage:
            return "detail_panel_mileage_button".localized
        case .spending:
            return "detail_panel_spending_button".localized
        }
    }
    
}
