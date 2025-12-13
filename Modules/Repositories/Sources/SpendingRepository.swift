//
//  File.swift
//  Repositories
//
//  Created by Theo Sementa on 13/12/2025.
//

import Foundation
import Models
import Persistence
import SwiftData

public final class SpendingRepository: GenericRepository<SpendingEntity> {
    
    public func fetchWithPagination(
        vehicleId: UUID,
        page: Int
    ) throws -> [SpendingEntity] {
        let pageSize: Int = 1
        
        var descriptor = FetchDescriptor<SpendingEntity>(
            predicate: #Predicate { $0.vehicle.localId == vehicleId },
            sortBy: [SortDescriptor(\.createdAt, order: .reverse)]
        )
        descriptor.fetchOffset = page * pageSize
        descriptor.fetchLimit = pageSize
        
        return try container.mainContext.fetch(descriptor)
    }
    
}
