//
//  SwiftUIView.swift
//  DesignSystem
//
//  Created by Theo Sementa on 12/12/2025.
//

import SwiftUI

public struct DatePickerView: View {
    
    // MARK: Dependencies
    @Binding var selectedDate: Date
    
    // MARK: Init
    public init(selectedDate: Binding<Date>) {
        self._selectedDate = selectedDate
    }
    
    // MARK: - View
    public var body: some View {
        VStack(alignment: .leading, spacing: .small) {
            Text("word_image_optional".localized)
                .customFont(.Text.Small.medium, color: .Gray.dark)
            
            HStack(spacing: .medium) {
                Text(selectedDate.formatted(.dateTime.day().month().year()))
                    .customFont(.Text.Medium.medium, color: .Gray.veryDark)
                    .fullWidth(.leading)
                
            }
            .padding(.horizontal, .medium)
            .padding(.vertical, .small)
            .roundedBackground(
                color: .Base.white,
                radius: .small,
                strokeColor: .Gray.light
            )
            .overlay {
                HStack {
                    DatePicker(selection: $selectedDate) { }
                        .labelsHidden()
                    DatePicker(selection: $selectedDate) { }
                        .labelsHidden()
                    DatePicker(selection: $selectedDate) { }
                        .labelsHidden()
                }
            }
        }
    }
}

// MARK: - Preview
#Preview {
    @Previewable @State var mockDate: Date = .now
    DatePickerView(selectedDate: $mockDate)
}
