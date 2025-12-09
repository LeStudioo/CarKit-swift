//
//  String+Extensions.swift
//  DesignSystem
//
//  Created by Theo Sementa on 09/12/2025.
//

import Foundation

public extension String {

    var localized: String {
        return NSLocalizedString(self, comment: "")
    }

}
