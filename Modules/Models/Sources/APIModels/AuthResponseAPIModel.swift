//
//  File.swift
//  Models
//
//  Created by Theo Sementa on 24/12/2025.
//

import Foundation

public struct AuthResponseAPIModel: APIModel {
    public let user: UserAPIModel
    public let accessToken: String
    public let refreshToken: String
    
    public enum CodingKeys: String, CodingKey {
        case user
        case accessToken = "token"
        case refreshToken
    }
    
    public init(
        user: UserAPIModel,
        accessToken: String,
        refreshToken: String
    ) {
        self.user = user
        self.accessToken = accessToken
        self.refreshToken = refreshToken
    }
}
