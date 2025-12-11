//
//  GenericRepository.swift
//  Persistence
//
//  Created by Theo Sementa on 10/12/2025.
//

import Foundation
import SwiftData
import Models

@MainActor
open class GenericRepository<T: PersistentModel & EntityProtocol> {
    
    public let container: ModelContainer
    public let context: ModelContext

    public init() {
        let manager: SwiftDataContextManager = .shared
        
        self.container = manager.container
        self.context = manager.context
    }
    
}

public extension GenericRepository {
    func insert(_ entity: T) throws {
        container.mainContext.insert(entity)
        try container.mainContext.save()
    }

    func delete(by id: UUID) throws {
        try container.mainContext.delete(
            model: T.self,
            where: #Predicate { $0.localId == id }
        )
        try container.mainContext.save()
    }
    
    func fetchAll() throws -> [T] {        
        let fetchDescriptor = FetchDescriptor<T>(sortBy: [])
        let tags = try container.mainContext.fetch(fetchDescriptor)
        return tags
    }
    
    func fetchOneById(_ id: UUID) throws -> T {
        let predicate = #Predicate<T> { $0.localId == id }
        
        var fetchDescriptor = FetchDescriptor<T>(predicate: predicate)
        fetchDescriptor.fetchLimit = 1
        
        let results = try container.mainContext.fetch(fetchDescriptor)
        if let first = results.first {
            return first
        } else {
            throw NSError(domain: "Error fetch one by id", code: 10)
        }
    }
}
