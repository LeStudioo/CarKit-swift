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
            Text("Date".localized) // TODO: TBL
                .customFont(.Text.Small.medium, color: .Gray.dark)
            
            HStack(spacing: .medium) {
                Text(selectedDate.formatted(.dateTime.day().month().year()))
                    .customFont(.Text.Medium.medium, color: .Gray.veryDark)
                    .fullWidth(.leading)
                    .contentTransition(.numericText())
                    .animation(.smooth, value: selectedDate)
                
            }
            .padding(.horizontal, .medium)
            .padding(.vertical, .small)
            .roundedBackground(
                color: .Base.white,
                radius: .small,
                strokeColor: .Gray.light
            )
            .overlay {
                HStack(spacing: .zero) {
                    DatePicker(selection: $selectedDate, displayedComponents: .date) { }
                        .labelsHidden()
                        .colorMultiply(.clear)
                    DatePicker(selection: $selectedDate, displayedComponents: .date) { }
                        .labelsHidden()
                        .colorMultiply(.clear)
                    DatePicker(selection: $selectedDate, displayedComponents: .date) { }
                        .labelsHidden()
                        .colorMultiply(.clear)
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
