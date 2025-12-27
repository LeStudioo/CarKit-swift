//
//  NetworkPath.swift
//  Networking
//
//  Created by Theo Sementa on 10/12/2025.
//

import Foundation

enum NetworkPath {
    static let baseURL: String = "https://carkit.lazyy.fr"

    enum Auth {
        static let apple: String = "/auth/apple"
        static let google: String = "/auth/google"
    }

    enum User {
        static let me: String = "/user/me" // swiftlint:disable:this identifier_name
        static func refreshToken(refreshToken: String) -> String {
            return "/user/refresh-token/\(refreshToken)"
        }
    }
    
    enum Vehicle {
        static func path() -> String {
            return "/vehicles"
        }
        static func path(for id: String) -> String {
            return "/vehicles/\(id)"
        }
    }

    enum Spending {
        static func path(vehicleId: String) -> String {
            return "/vehicles/\(vehicleId)/spendings"
        }
        static func path(vehicleId: String, spendingId: String) -> String {
            return "/vehicles/\(vehicleId)/spendings/\(spendingId)"
        }
    }
    
    enum Mileage {
        static func path(vehicleId: String) -> String {
            return "/vehicles/\(vehicleId)/mileages"
        }
        static func path(vehicleId: String, spendingId: String) -> String {
            return "/vehicles/\(vehicleId)/mileages/\(spendingId)"
        }
    }

    enum Service {
        static func manage(carId: String) -> String {
            return "/service/\(carId)"
        }
    }

    enum Part {
        static func manage(carId: String) -> String {
            return "/part/\(carId)"
        }
    }

    enum FullTank {
        static func manage(carId: String) -> String {
            return "/full-tank/\(carId)"
        }
    }

}
