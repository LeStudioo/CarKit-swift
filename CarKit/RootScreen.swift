//
//  RootScreen.swift
//  CarKit
//
//  Created by Theo Sementa on 10/12/2025.
//

import SwiftUI
import Navigation
import ToastBannerKit
import DesignSystem
import Home

struct RootScreen: View {
    
    @StateObject private var router: Router<AppDestination> = .init()
    @State private var toastBannerService: ToastBannerService = .shared
    
    // MARK: - View
    var body: some View {
        NavigationStackView(
            router: router,
            destinationContent: { AppDestination.content(for: $0) },
            initialContent: { HomeScreen() }
        )
        .environment(toastBannerService)
        .toastBanner(item: $toastBannerService.banner) { banner in
            BannerView(banner: banner)
        }
    }
}

// MARK: - Preview
#Preview {
    RootScreen()
}
