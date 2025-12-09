//
//  ExtendedUIFont.swift
//  DesignSystem
//
//  Created by Theo Sementa on 09/12/2025.
//

import Foundation
import SwiftUI

public enum CustomFont: String {
    case regular = "Satoshi-Regular"
    case medium = "Satoshi-Medium"
    case bold = "Satoshi-Bold"
    case black = "Satoshi-Black"
}

public struct ExtendedUIFont: Sendable {
    var name: String
    var size: CGFloat
    var lineHeight: CGFloat

    public init(
        weight: CustomFont,
        size: CGFloat,
        lineHeight: CGFloat
    ) {
        self.name = weight.rawValue
        self.size = size
        self.lineHeight = lineHeight
    }
}

extension ExtendedUIFont {

    public struct Display {
        public struct Medium { // swiftlint:disable:this nesting
            /// `This font is in "Regular 36" style`
            public static let regular: ExtendedUIFont = ExtendedUIFont(weight: .regular, size: 36, lineHeight: 44)
            /// `This font is in "Medium 36" style`
            public static let medium: ExtendedUIFont = ExtendedUIFont(weight: .medium, size: 36, lineHeight: 44)
            /// `This font is in "Bold 36" style`
            public static let bold: ExtendedUIFont = ExtendedUIFont(weight: .bold, size: 36, lineHeight: 44)
        }

        public struct ExtraSmall { // swiftlint:disable:this nesting
            /// `This font is in "Regular 24" style`
            public static let regular: ExtendedUIFont = ExtendedUIFont(weight: .regular, size: 24, lineHeight: 32)
            /// `This font is in "Medium 24" style`
            public static let medium: ExtendedUIFont = ExtendedUIFont(weight: .medium, size: 24, lineHeight: 32)
            /// `This font is in "Bold 24" style`
            public static let bold: ExtendedUIFont = ExtendedUIFont(weight: .bold, size: 24, lineHeight: 32)
        }
    }

    public struct Text {
        public struct Medium { // swiftlint:disable:this nesting
            /// `This font is in "Regular 16" style`
            public static let regular: ExtendedUIFont = ExtendedUIFont(weight: .regular, size: 16, lineHeight: 24)
            /// `This font is in "Medium 16" style`
            public static let medium: ExtendedUIFont = ExtendedUIFont(weight: .medium, size: 16, lineHeight: 24)
            /// `This font is in "Bold 16" style`
            public static let bold: ExtendedUIFont = ExtendedUIFont(weight: .bold, size: 16, lineHeight: 24)
        }

        public struct Small { // swiftlint:disable:this nesting
            /// `This font is in "Regular 14" style`
            public static let regular: ExtendedUIFont = ExtendedUIFont(weight: .regular, size: 14, lineHeight: 20)
            /// `This font is in "Medium 14" style`
            public static let medium: ExtendedUIFont = ExtendedUIFont(weight: .medium, size: 14, lineHeight: 20)
            /// `This font is in "Bold 14" style`
            public static let bold: ExtendedUIFont = ExtendedUIFont(weight: .bold, size: 14, lineHeight: 20)
        }

        public struct ExtraSmall { // swiftlint:disable:this nesting
            /// `This font is in "Regular 12" style`
            public static let regular: ExtendedUIFont = ExtendedUIFont(weight: .regular, size: 12, lineHeight: 18)
            /// `This font is in "Medium 12" style`
            public static let medium: ExtendedUIFont = ExtendedUIFont(weight: .medium, size: 12, lineHeight: 18)
            /// `This font is in "Bold 12" style`
            public static let bold: ExtendedUIFont = ExtendedUIFont(weight: .bold, size: 12, lineHeight: 18)
        }
    }

}
