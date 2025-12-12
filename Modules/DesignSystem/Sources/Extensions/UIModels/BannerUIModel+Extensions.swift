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

public extension BannerUIModel { // TODO: TBL
    
    @MainActor
    static let vehicleCreated: BannerUIModel = .init(
        title: "Vehicle successfully added !",
        style: BannerStyle.success
    )
    
}
