//
//  SignInWithAppleService.swift
//  Features
//
//  Created by Theo Sementa on 24/12/2025.
//

import Foundation
import AuthenticationServices
import Networking
import Models
import Stores
import Core

class SignInWithAppleService: NSObject {

    func performSignIn() {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.email]

        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
    }

}

extension SignInWithAppleService: ASAuthorizationControllerDelegate,
                                  ASAuthorizationControllerPresentationContextProviding {

    func authorizationController(
        controller: ASAuthorizationController,
        didCompleteWithAuthorization authorization: ASAuthorization
    ) {
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {

            @Dependency(\.userStore) var userStore
            @Dependency(\.appStateService) var appStateService

            guard let appleIDToken = appleIDCredential.identityToken else { return }
            guard let idTokenString = String(data: appleIDToken, encoding: .utf8) else { return }

            Task {
                let response = try await NetworkService.sendRequest(
                    apiBuilder: AuthAPIRequester.apple(body: .init(identityToken: idTokenString)),
                    responseModel: AuthResponseAPIModel.self
                )

                if response.accessToken.isNotEmpty, response.refreshToken.isNotEmpty {
                    TokenManager.shared.setTokens(
                        accessToken: response.accessToken,
                        refreshToken: response.refreshToken
                    )
                    appStateService.state = .runningAndConnected
                    userStore.currentUser = response.user
                }
            }
        }
    }

    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("Sign in with Apple errored: \(error.localizedDescription)")
    }

    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first ?? UIWindow()
    }
}
