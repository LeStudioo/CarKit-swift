//
//  SwiftUIView.swift
//  DesignSystem
//
//  Created by Theo Sementa on 09/12/2025.
//

import SwiftUI
import Models
import ToastBannerKit

public struct BannerView: View {

    // MARK: Dependencies
    let banner: ToastBannerUIModel

    // MARK: Init
    public init(banner: ToastBannerUIModel) {
        self.banner = banner
    }
    
    // MARK: Computed variables
    var style: BannerStyle {
        return BannerStyle(rawValue: banner.style.rawValue) ?? .error
    }

    // MARK: -
    public var body: some View {
        HStack(spacing: .small) {
            Text(banner.title)
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
//        .gesture(
//            DragGesture()
//                .onChanged { gesture in
//                    if gesture.translation.height < 0 {
//                        onCancelTapped()
//                    }
//                }
//        )
        .padding(.horizontal, .large)
    }
}

// MARK: - Preview
#Preview {
    VStack(spacing: .large) {
        BannerView(banner: .vehicleCreated)
    }
}
