//
//  IconView.swift
//  DesignSystem
//
//  Created by Theo Sementa on 09/12/2025.
//

import SwiftUI

public struct IconView: View {

    // MARK: Dependencies
    private let asset: ImageType
    private let size: IconSizeType
    private let color: Color

    // MARK: Init
    public init(
        asset: ImageType,
        size: IconSizeType = .standard,
        color: Color = Color.Base.black
    ) {
        self.asset = asset
        self.size = size
        self.color = color
    }

    // MARK: - View
    public var body: some View {
        Image(asset: asset)
            .resizable()
            .renderingMode(.template)
            .foregroundStyle(color)
            .frame(width: size.rawValue, height: size.rawValue)
    }
}

// MARK: - Preview
#Preview {
    IconView(asset: .iconUser)
}
