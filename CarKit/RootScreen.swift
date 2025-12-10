//
//  RootScreen.swift
//  CarKit
//
//  Created by Theo Sementa on 10/12/2025.
//

import SwiftUI
import Navigation
import Home

struct RootScreen: View {
    
    @StateObject private var router: Router<AppDestination> = .init()
    
    // MARK: - View
    var body: some View {
        NavigationStackView(
            router: router,
            destinationContent: { AppDestination.content(for: $0) },
            initialContent: { HomeScreen() }
        )
    }
}

// MARK: - Preview
#Preview {
    RootScreen()
}
