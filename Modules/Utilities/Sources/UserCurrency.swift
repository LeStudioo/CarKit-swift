//
//  UserCurrency.swift
//  Utilities
//
//  Created by Theo Sementa on 12/12/2025.
//

import Foundation

public struct UserCurrency {

    public static var symbol: String { // TODO: Add preference services
//        let currencyUnit = PreferencesService.get(String.self, forKey: .currencyUnit) ?? ""
//        return UserCurrency.getSymbol(forCurrencyCode: currencyUnit) ?? ""
        return getSymbol(forCurrencyCode: Locale.current.currency?.identifier ?? "USD") ?? ""
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
