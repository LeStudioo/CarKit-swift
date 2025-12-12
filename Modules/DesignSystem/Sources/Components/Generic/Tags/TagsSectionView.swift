//
//  TagsSection.swift
//  DesignSystem
//
//  Created by Theo Sementa on 12/12/2025.
//


import SwiftUI
import Models

public struct TagsSectionView: View {

    // MARK: Dependencies
    private var title: String
    private var items: [TagUIModel]
    @Binding private var selectedItem: TagUIModel?

    // MARK: Init
    public init(
        title: String,
        items: [TagUIModel],
        selectedItem: Binding<TagUIModel?>? = nil
    ) {
        self.title = title
        self.items = items
        self._selectedItem = selectedItem ?? .constant(nil)
    }

    // MARK: - View
    public var body: some View {
        VStack(alignment: .leading, spacing: .small) {
            Text(title)
                .customFont(.Text.Small.medium, color: .Gray.dark)

            FlowLayout(spacing: .small) {
                ForEach(items) { item in
                    Button {
                        withAnimation(.linear) { selectedItem = item }
                    } label: {
                        TagRowView(
                            item: item,
                            isSelected: selectedItem?.title == item.title
                        )
                    }
                }
            }
        }
        .fullWidth(.leading)
    }
}

// MARK: - Preview
#Preview {
    @Previewable @State var selectedItem: TagUIModel?
    TagsSectionView(
        title: "Preview Tags",
        items: [
        .init(title: "Tag 12346"),
        .init(title: "Tag 2"),
        .init(title: "Tag 3lkn"),
        .init(title: "Tag 4zlnflsz"),
        .init(title: "Tag 5clknccs"),
        .init(title: "Tag 6"),
        .init(title: "Tag 7"),
        .init(title: "Tag 8zklfbsklbfkz")
    ], selectedItem: $selectedItem)
    .padding()
}
