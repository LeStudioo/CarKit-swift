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
import Core
import Dependencies
import Models
import Stores
import Networking
import KeychainKit
import Home
import Authentification

struct RootScreen: View {
    
    @StateObject private var router: Router<AppDestination> = .init()
    @StateObject private var loginRouter: Router<AppDestination> = .init()
    @State private var toastBannerService: ToastBannerService = .shared
    
    @Dependency(\.appStateService) private var appStateService
    @Dependency(\.userStore) private var userStore
    
    // MARK: - View
    var body: some View {
        contentView
            .toastBanner(item: $toastBannerService.toastBanner) { banner in
                BannerView(banner: banner)
            }
            .environment(toastBannerService)
            .task {
                appStateService.state = .loading

                if KeychainService.hadRefreshToken {
                    do {
//                        try await userStore.refreshToken()
                        appStateService.state = .runningAndConnected
                    } catch {
                        appStateService.state = .runningWithoutInternet
                    }
                } else {
                    appStateService.state = .needToLogin
                }
            }
    }
}

// MARK: - Subviews
extension RootScreen {
    
    @ViewBuilder
    var contentView: some View {
        switch appStateService.state {
        case .idle:
            Text("TODO IDLE MODE")
        case .loading:
            Text("TODO LOADING MODE")
        case .runningAndConnected, .runningWithoutInternet:
            NavigationStackView(
                router: router,
                destinationContent: { AppDestination.content(for: $0) },
                initialContent: { HomeScreen() }
            )
        case .needToLogin:
            NavigationStackView(
                router: loginRouter,
                destinationContent: { AppDestination.content(for: $0) },
                initialContent: { LoginScreen() }
            )
        }
    }
    
}

// MARK: - Preview
#Preview {
    RootScreen()
}
