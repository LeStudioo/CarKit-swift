//
//  Regex.swift
//  DesignSystem
//
//  Created by Theo Sementa on 11/12/2025.
//

import Foundation

public enum Regex: String {
    case name = "^[a-zA-Z\\s]{1,33}$"
    case nameWithNumbers = "^[a-zA-Z0-9\\s]{1,33}$"
    case nameWithSpecialLettersAndNumbers = "^[A-Za-z0-9áàâãéèêíïóôõöúçñÁÀÂÃÉÈÍÏÓÔÕÖÚÇÑœ'’ -]{1,33}$"

    case username = "^[A-Za-z0-9]{1,20}$"
    case email = "^([a-zA-Z0-9_\\-\\.]+)@([a-zA-Z0-9_\\-\\.]+)\\.([a-zA-Z]{2,5})$"
    case password = "^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[@$!%*+?&])[A-Za-z0-9@$!%*+?&]{8,}$"

    case uppercase = ".*[A-Z]+.*"
    case lowercase = ".*[a-z]+.*"
    case number = ".*[0-9]+.*"
    case specialChar = ".*[@$!%*?&]+.*"
    case moreThan8 = ".{8,}"
}

public extension Regex {
    // swiftlint:disable:next operator_whitespace
    static func ~=(text: String, regex: Regex) -> Bool {
        let stringTest = NSPredicate(format: "SELF MATCHES %@", regex.rawValue)
        return stringTest.evaluate(with: text)
    }
}
