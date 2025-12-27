//
//  VehicleInfoRowView.swift
//  Features
//
//  Created by Theo Sementa on 27/12/2025.
//

import SwiftUI
import DesignSystem
import Models

struct VehicleInfoRowView: View {
    
    // MARK: Dependencies
    let vehicle: VehicleUIModel
    
    // MARK: States
    @State private var maxWidthText: CGFloat = 0
    
    // MARK: - View
    var body: some View {
        VStack(spacing: .large) {
            Text("vehicle_info_title".localized)
                .customFont(.Text.Small.medium, color: .Gray.mid)
                .fullWidth(.leading)

            VStack(spacing: 4) {
                infoRow(title: "vehicle_info_brand".localized, value: vehicle.brand)
                infoRow(title: "vehicle_info_model".localized, value: vehicle.model)
                infoRow(title: "vehicle_info_type".localized, value: vehicle.motorization.name)
                if let vehicleYear = vehicle.year {
                    infoRow(title: "vehicle_info_year".localized, value: String(vehicleYear))
                }
                infoRow(title: "vehicle_info_name".localized, value: vehicle.customName)
            }
        }
        .padding(.large)
        .roundedBackground(
            color: Color.Base.white,
            radius: .standard,
            strokeColor: Color.Gray.light
        )
    }
}

// MARK: - Subviews
extension VehicleInfoRowView {
    
    @ViewBuilder
    func infoRow(title: String, value: String) -> some View {
        HStack(spacing: 32) {
            Text(title)
                .customFont(.Text.Small.regular, color: .Gray.dark)
                .frame(width: maxWidthText == 0 ? nil : maxWidthText, alignment: .leading)
                .getSize { size in
                    if size.width > maxWidthText {
                        maxWidthText = size.width
                    }
                }

            Text(value)
                .customFont(.Text.Small.bold, color: .Gray.veryDark)
                .fullWidth(.leading)
        }
    }
    
}

// MARK: - Preview
#Preview {
    VehicleInfoRowView(vehicle: .mock)
}
