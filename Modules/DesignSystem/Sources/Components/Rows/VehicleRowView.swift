//
//  SwiftUIView.swift
//  DesignSystem
//
//  Created by Theo Sementa on 09/12/2025.
//

import SwiftUI

public struct VehicleRowView: View {

    // MARK: Dependencies
    private let uiImage: UIImage?
    private let title: String
    private let subtitle: String

    // MARK: Computed variables
    var hasImage: Bool { return uiImage != nil }

    // MARK: Init
    public init(
        uiImage: UIImage? = nil,
        title: String,
        subtitle: String
    ) {
        self.uiImage = uiImage
        self.title = title
        self.subtitle = subtitle
    }

    // MARK: - View
    public var body: some View {
        ZStack(alignment: .bottom) {
            if let uiImage {
                imageView(for: uiImage)
            }

            textView
                .fullWidth(.leading)
                .padding(.standard)
        }
        .fullWidth()
        .roundedBackground(
            color: .Base.white,
            radius: .small,
            strokeColor: .Gray.light
        )
    }

}

// MARK: - Subviews
extension VehicleRowView {

    func imageView(for uiImage: UIImage) -> some View {
        Image(uiImage: uiImage)
            .resizable()
            .scaledToFill()
            .frame(height: 200)
            .overlay {
                LinearGradient(
                    colors: [
                        Color.Base.black.opacity(0),
                        Color.Base.black.opacity(0.75)
                    ],
                    startPoint: .center,
                    endPoint: .bottom
                )
            }
            .clipShape(.rect(cornerRadius: .small, style: .continuous))
    }

    var textView: some View {
        VStack(alignment: .leading, spacing: .zero) {
            Text(title)
                .customFont(
                    .Text.Medium.bold,
                    color: hasImage ? Color.Base.white : Color.Base.black
                )

            Text(subtitle)
                .customFont(
                    .Text.Small.regular,
                    color: hasImage ? Color.Gray.light : Color.Base.black
                )
        }
    }

}

// MARK: - Preview
#Preview {
    VStack(spacing: .large) {
        VehicleRowView(
            uiImage: UIImage(resource: .previewCar),
            title: "Audi RS6",
            subtitle: "Voiture de Théo"
        )

        VehicleRowView(
            title: "Afla Romeo 147",
            subtitle: "Voiture de Papa"
        )
    }
    .padding(.large)
}
