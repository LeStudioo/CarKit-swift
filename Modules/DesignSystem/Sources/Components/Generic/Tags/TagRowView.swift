//
//  SwiftUIView.swift
//  DesignSystem
//
//  Created by Theo Sementa on 12/12/2025.
//

import SwiftUI
import Models

public struct TagRowView: View {

    // MARK: Dependencies
    private var item: TagUIModel
    private var isSelected: Bool = false

    // MARK: Init
    public init(
        item: TagUIModel,
        isSelected: Bool = false
    ) {
        self.item = item
        self.isSelected = isSelected
    }

    // MARK: - View
    public var body: some View {
        Text(item.title.localized)
            .customFont(.Text.Small.medium, color: isSelected ? .Base.white : .Gray.veryDark)
            .padding(.standard)
            .roundedBackground(
                color: isSelected ? .Brand.secondary : .Base.white,
                radius: .small,
                strokeColor: isSelected ? nil : Color.Gray.light
            )
    }
}

// MARK: - Preview
#Preview {
    TagRowView(item: .init(title: "Preview"))
    TagRowView(item: .init(title: "Preview", icon: "iconTires"), isSelected: true)
    TagRowView(item: .init(title: "Preview", icon: "iconTires"))
}
