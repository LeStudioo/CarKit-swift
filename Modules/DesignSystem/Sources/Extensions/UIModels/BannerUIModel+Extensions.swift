//
//  BannerUIModel+Extensions.swift
//  DesignSystem
//
//  Created by Theo Sementa on 12/12/2025.
//

import Foundation
import Models
import ToastBannerKit

extension BannerStyle: @retroactive ToastBannerStyleProtocol { }

public extension ToastBannerUIModel {
    
    @MainActor
    static let vehicleCreated: ToastBannerUIModel = .init(
        title: "toast_banner_vehicle_created".localized,
        style: BannerStyle.success
    )
    
}
