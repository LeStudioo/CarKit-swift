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
            return Color("baseWhite", bundle: BundleHelper.bundle)
        }
        public static var black: Color {
            return Color("baseBlack", bundle: BundleHelper.bundle)
        }
    }

    public struct Brand {
        public static var light: Color {
            return Color("brandLight", bundle: BundleHelper.bundle)
        }
        public static var primary: Color {
            return Color("brandPrimary", bundle: BundleHelper.bundle)
        }
        public static var secondary: Color {
            return Color("brandSecondary", bundle: BundleHelper.bundle)
        }
        public static var tertiary: Color {
            return Color("brandTertiary", bundle: BundleHelper.bundle)
        }
    }

    public struct Error {
        public static var light: Color {
            return Color("errorLight", bundle: BundleHelper.bundle)
        }
        public static var primary: Color {
            return Color("errorPrimary", bundle: BundleHelper.bundle)
        }
        public static var secondary: Color {
            return Color("errorSecondary", bundle: BundleHelper.bundle)
        }
    }

    public struct Gray {
        public static var light: Color {
            return Color("grayLight", bundle: BundleHelper.bundle)
        }
        public static var dark: Color {
            return Color("grayDark", bundle: BundleHelper.bundle)
        }
        public static var mid: Color {
            return Color("grayMid", bundle: BundleHelper.bundle)
        }
        public static var veryLight: Color {
            return Color("grayVeryLight", bundle: BundleHelper.bundle)
        }
        public static var veryDark: Color {
            return Color("grayVeryDark", bundle: BundleHelper.bundle)
        }
    }

    public struct Success {
        public static var light: Color {
            return Color("successLight", bundle: BundleHelper.bundle)
        }
        public static var primary: Color {
            return Color("successPrimary", bundle: BundleHelper.bundle)
        }
    }

    public struct Warning {
        public static var primary: Color {
            return Color("warningPrimary", bundle: BundleHelper.bundle)
        }
        public static var secondary: Color {
            return Color("warningSecondary", bundle: BundleHelper.bundle)
        }
    }

}
