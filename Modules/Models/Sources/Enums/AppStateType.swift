//
//  File.swift
//  Models
//
//  Created by Theo Sementa on 24/12/2025.
//

import Foundation

public enum AppStateType {
    case idle
    case loading
    case runningAndConnected
    case runningWithoutInternet
    case needToLogin
}
