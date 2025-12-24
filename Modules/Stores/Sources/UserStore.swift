//
//  UserStore.swift
//  Stores
//
//  Created by Theo Sementa on 24/12/2025.
//


import Foundation
import Models
import Dependencies

@MainActor @Observable
public final class UserStore: @unchecked Sendable {
//    @MainActor public static let shared = UserStore()

    public var currentUser: UserAPIModel?

    public var isUserLogged: Bool {
        return currentUser != nil
    }
}

extension UserStore {


}

// MARK: - Dependencies
extension UserStore: @preconcurrency DependencyKey {
    public static let liveValue = UserStore()
}

extension DependencyValues {
    public var userStore: UserStore {
        get { self[UserStore.self] }
        set { self[UserStore.self] = newValue }
    }
}
