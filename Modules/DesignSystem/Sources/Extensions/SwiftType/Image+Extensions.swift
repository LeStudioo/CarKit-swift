//
//  File.swift
//  DesignSystem
//
//  Created by Theo Sementa on 09/12/2025.
//

import SwiftUI

public extension Image {

    init(asset: ImageType) {
        self.init(asset.rawValue, bundle: .module)
    }

}
