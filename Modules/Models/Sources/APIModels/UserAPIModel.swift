//
//  File.swift
//  Models
//
//  Created by Theo Sementa on 24/12/2025.
//

import Foundation

public struct UserAPIModel: APIModel {
    public let id: String
    public let providerUserId: String
    public let provider: String
    public let email: String
    
    public init(
        id: String,
        providerUserId: String,
        provider: String,
        email: String
    ) {
        self.id = id
        self.providerUserId = providerUserId
        self.provider = provider
        self.email = email
    }
}
