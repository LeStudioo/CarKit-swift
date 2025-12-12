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

public extension ToastBannerUIModel { // TODO: TBL
    
    @MainActor
    static let vehicleCreated: ToastBannerUIModel = .init(
        title: "Vehicle successfully added !",
        style: BannerStyle.success
    )
    
}
