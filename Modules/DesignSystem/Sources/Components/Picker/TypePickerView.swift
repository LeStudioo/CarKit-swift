//
//  SwiftUIView.swift
//  DesignSystem
//
//  Created by Theo Sementa on 10/12/2025.
//

import SwiftUI
import Models

public struct TypePickerView<T: TypePickerItem>: View {
    
    // MARK: Dependencies
    var title: String
    @Binding var selectedItem: T
    
    // MARK: Init
    public init(
        title: String,
        selectedItem: Binding<T>
    ) {
        self.title = title
        self._selectedItem = selectedItem
    }
    
    // MARK: -
    public var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .customFont(.Text.Small.medium, color: .Gray.dark)
            
            Menu {
                ForEach(Array(T.allCases), id: \.rawValue) { item in
                    Button(
                        action: { selectedItem = item },
                        label: {
                            if selectedItem == item {
                                Label(item.name, systemImage: "checkmark")
                            } else {
                                Text(item.name)
                            }
                        }
                    )
                }
            } label: {
                HStack(spacing: .medium) {
                    Text(selectedItem.name)
                        .customFont(.Text.Medium.medium, color: .Gray.veryDark)
                        .fullWidth(.leading)
                    
                    IconView(asset: .iconChevronDown, size: .small, color: .Gray.veryDark)
                }
                .padding(.horizontal, .medium)
                .padding(.vertical, .small)
                .roundedBackground(
                    color: .Base.white,
                    radius: .small,
                    strokeColor: .Gray.light
                )
            }
        }
    }
}

// MARK: - Preview
#Preview {
    TypePickerView(
        title: "Type",
        selectedItem: .constant(MotorizationType.thermal)
    )
}
