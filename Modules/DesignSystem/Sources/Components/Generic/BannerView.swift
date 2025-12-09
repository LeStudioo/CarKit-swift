//
//  SwiftUIView.swift
//  DesignSystem
//
//  Created by Theo Sementa on 09/12/2025.
//

import SwiftUI
import Models

public struct BannerView: View {

    // MARK: Dependencies
    var title: String
    var style: BannerStyle
    var onCancelTapped: (() -> Void)

    // MARK: Init
    public init(
        title: String,
        style: BannerStyle,
        onCancelTapped: @escaping () -> Void
    ) {
        self.title = title
        self.style = style
        self.onCancelTapped = onCancelTapped
    }

    // MARK: -
    public var body: some View {
        HStack(spacing: .small) {
            Text(title)
                .customFont(.Text.Small.bold, color: style.foregroundColor)
                .multilineTextAlignment(.leading)
                .lineLimit(2)
                .fullWidth(.leading)

            IconView(asset: .iconXmark, color: style.foregroundColor)
        }
        .padding(.standard)
        .roundedBackground(
            color: style.backgroundColor,
            radius: .small,
            strokeColor: .Gray.light
        )
        .onTapGesture {
            onCancelTapped()
        }
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    if gesture.translation.height < 0 {
                        onCancelTapped()
                    }
                }
        )
        .padding(.horizontal, .large)
    }
}

// MARK: - Preview
#Preview {
    VStack(spacing: .large) {
        BannerView(
            title: "This is a banner",
            style: .error,
            onCancelTapped: {}
        )

        BannerView(
            title: "This is a banner",
            style: .success,
            onCancelTapped: {}
        )
    }
}
