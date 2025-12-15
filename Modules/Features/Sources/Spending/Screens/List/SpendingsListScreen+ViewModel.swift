//
//  File.swift
//  Features
//
//  Created by Theo Sementa on 15/12/2025.
//

import Foundation
import Stores

extension SpendingsListScreen {
    
    @Observable
    final class ViewModel {
        
        @ObservationIgnored
        @Dependency(\.spendingStore) var spendingStore
        
        var page: Int = 0
            
    }
    
}

// MARK: - Public functions
extension SpendingsListScreen.ViewModel {
    
    @MainActor
    func fetchSpendings() async {
        await spendingStore.fetchWithPagination(page: page)
        page += 1
    }
    
}
