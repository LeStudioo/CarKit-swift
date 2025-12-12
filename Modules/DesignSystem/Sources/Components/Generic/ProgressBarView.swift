//
//  SwiftUIView.swift
//  DesignSystem
//
//  Created by Theo Sementa on 12/12/2025.
//

import SwiftUI

public struct ProgressBarView: View {

    // MARK: Dependencies
    public var progress: Double
    
    // MARK: Init
    public init(progress: Double) {
        self.progress = progress
    }

    // MARK: - View
    public var body: some View {
        Capsule()
            .fill(Color.Gray.light)
            .frame(height: 12)
            .overlay(alignment: .leading) {
                GeometryReader { geo in
                    Capsule()
                        .fill(Color.Brand.secondary)
                        .frame(width: geo.size.width * CGFloat(progress))
                }
            }
    }
}

// MARK: - Preview
#Preview {
    ProgressBarView(progress: 0.5)
        .padding()
}
