//
//  Double+Extensions.swift
//  DesignSystem
//
//  Created by Theo Sementa on 09/12/2025.
//

import Foundation

public extension Double {

    func toCurrency() -> String {
        return self
            .formatted(.currency(code: Locale.current.currency?.identifier ?? "USD"))
    }

}
