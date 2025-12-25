//
//  NetworkPath.swift
//  Networking
//
//  Created by Theo Sementa on 10/12/2025.
//

import Foundation

struct NetworkPath { // TODO: CHange to enum with static
    static let baseURL: String = "https://carkit.lazyy.fr"

    struct Auth {
        static let apple: String = "/auth/apple"
        static let google: String = "/auth/google"
    }

    struct User {
        static let me: String = "/user/me" // swiftlint:disable:this identifier_name
        static func refreshToken(refreshToken: String) -> String {
            return "/user/refresh-token/\(refreshToken)"
        }
    }
    
    struct Vehicle {
        static func path() -> String {
            return "/vehicles"
        }
        static func path(for id: String) -> String {
            return "/vehicles/\(id)"
        }
    }

    struct Spending {
        static func path(vehicleId: String) -> String {
            return "/vehicles/\(vehicleId)/spendings"
        }
        static func path(vehicleId: String, spendingId: String) -> String {
            return "/vehicles/\(vehicleId)/spendings/\(spendingId)"
        }
    }
    
    struct Mileage {
        static func path(vehicleId: String) -> String {
            return "/vehicles/\(vehicleId)/mileages"
        }
        static func path(vehicleId: String, spendingId: String) -> String {
            return "/vehicles/\(vehicleId)/mileages/\(spendingId)"
        }
    }

    struct Service {
        static func manage(carId: String) -> String {
            return "/service/\(carId)"
        }
    }

    struct Part {
        static func manage(carId: String) -> String {
            return "/part/\(carId)"
        }
    }

    struct FullTank {
        static func manage(carId: String) -> String {
            return "/full-tank/\(carId)"
        }
    }

}
