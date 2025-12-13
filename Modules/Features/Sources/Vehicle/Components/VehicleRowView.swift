//
//  VehicleRowView.swift
//  Features
//
//  Created by Theo Sementa on 11/12/2025.
//

import SwiftUI
import Models
import Stores
import DesignSystem

public struct VehicleRowView: View {

    // MARK: Dependencies
    private let vehicle: VehicleUIModel
    @Dependency(\.vehicleStore) private var vehicleStore

    // MARK: Computed variables
    var uiImage: UIImage? {
        return UIImage(data: vehicle.imageData ?? Data())
    }
    var hasImage: Bool {
        return uiImage != nil
    }

    // MARK: Init
    public init(vehicle: VehicleUIModel) {
        self.vehicle = vehicle
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
        .contentShape(.contextMenuPreview, .rect(cornerRadius: .small))
        .contextMenu {
            contextMenuView
        } preview: {
            self
                .frame(width: UIScreen.main.bounds.width - 32)
        }
    }

}

// MARK: - Subviews
extension VehicleRowView {

    private func imageView(for uiImage: UIImage) -> some View {
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

    private var textView: some View {
        VStack(alignment: .leading, spacing: .zero) {
            Text(vehicle.fullName)
                .customFont(
                    .Text.Medium.bold,
                    color: hasImage ? Color.Base.white : Color.Base.black
                )

            Text(vehicle.customName)
                .customFont(
                    .Text.Small.regular,
                    color: hasImage ? Color.Gray.light : Color.Base.black
                )
        }
    }
    
    @ViewBuilder
    private var contextMenuView: some View {
        Button(role: .destructive) {
            vehicleStore.delete(for: vehicle.id)
        } label: {
            Label("Delete", systemImage: "trash")
        }
    }

}

// MARK: - Preview
#Preview {
    VStack(spacing: .large) {
        let mockWithImage = VehicleUIModel.mock
        VehicleRowView(vehicle: mockWithImage)
//            .onAppear {
//                mockWithImage.imageData = UIImage(resource: .previewCar).pngData()
//            }
        
        VehicleRowView(vehicle: .mock)
    }
    .padding(.large)
}
