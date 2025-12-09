//
//  File.swift
//  DesignSystem
//
//  Created by Theo Sementa on 09/12/2025.
//

import Foundation
import SwiftUI

public extension View {

    func customFont(_ font: ExtendedUIFont, color: Color = .Base.black) -> some View {
        var uiFont: UIFont {
            return UIFont(name: font.name, size: font.size) ?? UIFont.systemFont(ofSize: font.size)
        }

        return self
            .font(Font(uiFont))
            .foregroundStyle(color)
            .lineSpacing(font.lineHeight - uiFont.lineHeight)
            .padding(.vertical, (font.lineHeight - uiFont.lineHeight) / 2)
    }

    func fullWidth(_ alignment: Alignment = .center) -> some View {
        return self.frame(maxWidth: .infinity, alignment: alignment)
    }

    func roundedBackground(
        color: Color,
        radius: CGFloat,
        strokeColor: Color? = nil,
    ) -> some View {
        return self
            .background(
                RoundedRectangle(cornerRadius: radius, style: .continuous)
                    .fill(color)
                    .strokeBorder(strokeColor ?? .clear, lineWidth: 1)
            )
    }

}
