//
//  SwiftUIView.swift
//  Features
//
//  Created by Theo Sementa on 25/12/2025.
//

import SwiftUI
import Preferences
import DesignSystem

public struct CurrencyListScreen: View {

    @Environment(\.dismiss) private var dismiss
    @AppStorageKey(\.currencyCode) private var currencyCode

    // MARK: Constants
    let availableCurrencies: [String] = {
        let locales = Locale.availableIdentifiers.map { Locale(identifier: $0) }
        return Array(Set(locales.compactMap { $0.currency?.identifier })).sorted(by: <)
    }()

    public init() { }
    
    // MARK: -
    public var body: some View {
        VStack(spacing: .zero) {
            NavigationBarView( // TODO: TBL
                title: "word_currency".localized,
                backButtonText: "word_profile".localized
            )

            List {
                ForEach(availableCurrencies, id: \.self) { currency in
                    Button(action: {
                        currencyCode = currency
                        dismiss()
                    }, label: {
                        HStack {
                            Text(currency)
                            Spacer()
                            Text(getSymbol(forCurrencyCode: currency) ?? "")
                        }
                        .foregroundStyle(Color.black)
                    })
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
    }

    func getSymbol(forCurrencyCode code: String) -> String? {
        let locale = NSLocale(localeIdentifier: code)
        if locale.displayName(forKey: .currencySymbol, value: code) == code {
            let newlocale = NSLocale(localeIdentifier: code.dropLast() + "_en")
            return newlocale.displayName(forKey: .currencySymbol, value: code)
        }
        return locale.displayName(forKey: .currencySymbol, value: code)
    }

}

// MARK: - Preview
#Preview {
    CurrencyListScreen()
}
