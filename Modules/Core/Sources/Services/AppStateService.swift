//
//  File.swift
//  Core
//
//  Created by Theo Sementa on 24/12/2025.
//

import Foundation
import Dependencies
import Models

@Observable
public class AppStateService {
    
    public var state: AppStateType = .idle
    
}

// MARK: - Dependencies
extension AppStateService: @preconcurrency DependencyKey {
    public static let liveValue = AppStateService()
}

extension DependencyValues {
    public var appStateService: AppStateService {
        get { self[AppStateService.self] }
        set { self[AppStateService.self] = newValue }
    }
}
