//
//  AuthBody.swift
//  Models
//
//  Created by Theo Sementa on 24/12/2025.
//

import Foundation

public struct AuthBody: Codable {
    public var identityToken: String

    public init(identityToken: String) {
        self.identityToken = identityToken
    }
}
