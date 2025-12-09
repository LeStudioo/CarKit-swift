//
//  Color+Extensions.swift
//  DesignSystem
//
//  Created by Theo Sementa on 09/12/2025.
//

import SwiftUI

extension Color {

    public struct Base {
        public static var white: Color {
            return Color("baseWhite", bundle: .module)
        }
        public static var black: Color {
            return Color("baseBlack", bundle: .module)
        }
    }

    public struct Brand {
        public static var light: Color {
            return Color("brandLight", bundle: .module)
        }
        public static var primary: Color {
            return Color("brandPrimary", bundle: .module)
        }
        public static var secondary: Color {
            return Color("brandSecondary", bundle: .module)
        }
        public static var tertiary: Color {
            return Color("brandTertiary", bundle: .module)
        }
    }

    public struct Error {
        public static var light: Color {
            return Color("errorLight", bundle: .module)
        }
        public static var primary: Color {
            return Color("errorPrimary", bundle: .module)
        }
        public static var secondary: Color {
            return Color("errorSecondary", bundle: .module)
        }
    }

    public struct Gray {
        public static var light: Color {
            return Color("grayLight", bundle: .module)
        }
        public static var dark: Color {
            return Color("grayDark", bundle: .module)
        }
        public static var mid: Color {
            return Color("grayMid", bundle: .module)
        }
        public static var veryLight: Color {
            return Color("grayVeryLight", bundle: .module)
        }
        public static var veryDark: Color {
            return Color("grayVeryDark", bundle: .module)
        }
    }

    public struct Success {
        public static var light: Color {
            return Color("successLight", bundle: .module)
        }
        public static var primary: Color {
            return Color("successPrimary", bundle: .module)
        }
    }

    public struct Warning {
        public static var primary: Color {
            return Color("warningPrimary", bundle: .module)
        }
        public static var secondary: Color {
            return Color("warningSecondary", bundle: .module)
        }
    }

}
