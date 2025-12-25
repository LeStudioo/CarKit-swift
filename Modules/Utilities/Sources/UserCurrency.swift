//
//  UserCurrency.swift
//  Utilities
//
//  Created by Theo Sementa on 12/12/2025.
//

import Foundation
import Preferences

public struct UserCurrency {

    public static var symbol: String {
        @AppStorageKey(\.currencyCode) var currencyCode
        return Self.getSymbol(forCurrencyCode: currencyCode) ?? ""
    }

    public static func getSymbol(forCurrencyCode code: String) -> String? {
        let locale = NSLocale(localeIdentifier: code)
        if locale.displayName(forKey: .currencySymbol, value: code) == code {
            let newlocale = NSLocale(localeIdentifier: code.dropLast() + "_en")
            return newlocale.displayName(forKey: .currencySymbol, value: code)
        }
        return locale.displayName(forKey: .currencySymbol, value: code)
    }
}
