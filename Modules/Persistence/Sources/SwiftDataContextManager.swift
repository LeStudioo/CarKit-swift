//
//  SwiftDataContextManager.swift
//  Persistence
//
//  Created by Theo Sementa on 10/12/2025.
//

import Foundation
import SwiftData
import Models

@MainActor @Observable
final class SwiftDataContextManager {
    static let shared = SwiftDataContextManager()
    
    let container: ModelContainer
    var context: ModelContext
    
    private init() {
        do {
            container = try ModelContainer(for: VehicleEntity.self)
            context = container.mainContext
        } catch {
            fatalError("Échec de l'initialisation du ModelContainer: \(error.localizedDescription)")
        }
    }
}
