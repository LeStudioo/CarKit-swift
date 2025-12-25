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
        @AppStorageKey(\.currencyRawValue) var currencyRawValue
        return Self.getSymbol(forCurrencyCode: currencyRawValue) ?? ""
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
