//
//  File.swift
//  Navigation
//
//  Created by Theo Sementa on 12/12/2025.
//

import Foundation
import NavigationKit

public enum SpendingDestination: DestinationItem {
    case list
    case create(vehicleId: String)
}
