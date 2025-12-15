//
//  File.swift
//  DesignSystem
//
//  Created by Theo Sementa on 13/12/2025.
//

import Foundation
import Models

public extension DetailPanelStyle {
    
    var actionButtonTitle: String { // TODO: TBL
        switch self {
        case .mileage:
            return "Update mileage"
        case .spending:
            return "Add spending"
        }
    }
    
}
