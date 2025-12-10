//
//  NetworkPath.swift
//  Networking
//
//  Created by Theo Sementa on 10/12/2025.
//

import Foundation

struct NetworkPath {
    static let baseURL: String = "https://carkit.lazyy.fr"

    struct Auth {
        static let apple: String = "/auth/apple"
        static let google: String = "/auth/google"
    }

    struct User {
        static let me: String = "/user/me" // swiftlint:disable:this identifier_name
        static let register: String = "/user/register"
        static func refreshToken(refreshToken: String) -> String {
            return "/user/refresh-token/\(refreshToken)"
        }
    }
    
    struct Vehicle {
        static func path() -> String {
            return "/vehicle"
        }
        static func path(for id: String) -> String {
            return "/vehicle/\(id)"
        }
    }

    struct Spending {
        static func path(for id: String) -> String {
            return "/spending/\(id)"
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

    struct Mileage {
        static func manage(carId: String) -> String {
            return "/mileage/\(carId)"
        }
    }

    struct FullTank {
        static func manage(carId: String) -> String {
            return "/full-tank/\(carId)"
        }
    }

}
