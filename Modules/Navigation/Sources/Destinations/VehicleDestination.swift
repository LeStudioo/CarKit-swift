//
//  File.swift
//  Navigation
//
//  Created by Theo Sementa on 10/12/2025.
//

import Foundation
import NavigationKit

public enum VehicleDestination: DestinationItem {
    case create
    case detail(vehicleId: String)
}
