//
//  View+Extensions.swift
//  Utilities
//
//  Created by Theo Sementa on 11/12/2025.
//

import Foundation
import SwiftUI

public extension View {
    
    func getSize(size: @escaping (CGSize) -> Void) -> some View {
        return self
            .background(
                GeometryReader { proxy in
                    Color.clear
                        .onAppear { size(proxy.size) }
                }
            )
    }
    
}
