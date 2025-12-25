//
//  SignInWithGoogleService.swift
//  Features
//
//  Created by Theo Sementa on 25/12/2025.
//

// https://paulallies.medium.com/google-sign-in-swiftui-2909e01ea4ed
// https://github.com/google/GoogleSignIn-iOS/issues/378
import SwiftUI
import GoogleSignIn
import Networking
import Models
import Stores
import Core
import Dependencies

class SignInWithGoogleService: ObservableObject {

    @Published var isLoggedIn: Bool = false
    @Published var errorMessage: String = ""

}

extension SignInWithGoogleService {

    func getUserInfo() async {
        if GIDSignIn.sharedInstance.currentUser != nil {
            let user = GIDSignIn.sharedInstance.currentUser
            guard user != nil else { return }

            self.isLoggedIn = true
        } else {
            self.isLoggedIn = false
        }
    }

    @MainActor
    func signIn() {
        @Dependency(\.userStore) var userStore
        @Dependency(\.appStateService) var appStateService

        guard let presentingViewController = (
            UIApplication.shared.connectedScenes.first as? UIWindowScene
        )?.windows.first?.rootViewController else { return }
        
        Task {
            do {
                let googleResponse = try await GIDSignIn.sharedInstance.signIn(withPresenting: presentingViewController)
                let googleUser = googleResponse.user
                guard let identityToken = googleUser.idToken?.tokenString else { return }
                
                await self.getUserInfo()
                
                let response = try await NetworkService.sendRequest(
                    apiBuilder: AuthAPIRequester.google(body: .init(identityToken: identityToken)),
                    responseModel: AuthResponseAPIModel.self
                )

                if response.accessToken.isNotEmpty, response.refreshToken.isNotEmpty {
                    TokenManager.shared.setTokens(accessToken: response.accessToken, refreshToken: response.refreshToken)
                    appStateService.state = .runningAndConnected
                    userStore.currentUser = response.user
                }
            } catch {
                self.errorMessage = "error: \(error.localizedDescription)"
            }
        }
    }

    func signOut() {
        GIDSignIn.sharedInstance.signOut()
//        Task {
//            await self.getUserInfo() // Pourquoi faire ?
//        }
    }

}
