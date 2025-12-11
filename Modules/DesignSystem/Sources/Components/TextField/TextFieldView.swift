//
//  TextFieldView.swift
//  DesignSystem
//
//  Created by Theo Sementa on 11/12/2025.
//

import SwiftUI
import Combine
import Utilities

public struct TextFieldView: View {
    
    // MARK: Dependencies
    @Binding var text: String
    var config: Configuration
    
    // MARK: States
    @State private var isSecured: Bool = true
    @State private var height: CGFloat = 0
    @FocusState var isFocused: Bool
    
    // MARK: Init
    public init(
        text: Binding<String>,
        config: Configuration
    ) {
        self._text = text
        self.config = config
    }
    
    // MARK: - View
    public var body: some View {
        VStack(alignment: .leading, spacing: .small) {
            Text(config.title)
                .customFont(.Text.Small.medium, color: .Gray.dark)
            
            HStack(spacing: .small) {
                Group {
                    if config.isSecured && self.isSecured {
                        SecureField(config.placeholder, text: $text)
                    } else {
                        TextField(config.placeholder, text: $text)
                            .onReceive(Just(text)) { filterInput($0) }
                    }
                }
                .focused($isFocused)
                .customFont(.Text.Medium.medium, color: .Gray.veryDark)
                .keyboardType(config.type)
                
                if config.isSecured {
                    HStack(spacing: .standard) {
                        Rectangle()
                            .fill(Color.Gray.light)
                            .frame(width: 1, height: height)
                        
                        IconView(asset: .iconEye, size: .small, color: .Gray.dark)
                    }
                    .onTapGesture {
                        withAnimation { self.isSecured.toggle() }
                    }
                }
                
                if let unit = config.unit {
                    Text(unit)
                        .customFont(.Text.Small.medium, color: .Gray.dark)
                }
            }
            .padding(.horizontal, .medium)
            .padding(.vertical, config.isSecured ? 0 : .small)
            .roundedBackground(
                color: .Base.white,
                radius: .small,
                strokeColor: .Gray.light
            )
            .getSize { size in
                if height == 0 {
                    height = size.height + 20
                }
            }
            
            if let description = config.description {
                Text(description)
                    .customFont(.Text.Small.regular, color: .Gray.mid)
            }
        }
        .onTapGesture {
            isFocused.toggle()
        }
        
    }
    
    private func filterInput(_ newValue: String) {
        guard let regex = config.regex else { return }
        if newValue ~= regex {
            text = newValue
        } else {
            if text.isNotEmpty { text.removeLast() }
        }
    }
    
} // struct

// MARK: - Configuration
extension TextFieldView {
    public struct Configuration {
        var title: String
        var placeholder: String = ""
        var type: UIKeyboardType = .default
        var unit: String?
        var description: String?
        var isSecured: Bool = false
        var isRulesEnabled: Bool = false
        var regex: Regex?
        
        public init(
            title: String,
            placeholder: String = "",
            type: UIKeyboardType = .default,
            unit: String? = nil,
            description: String? = nil,
            isSecured: Bool = false,
            isRulesEnabled: Bool = false,
            regex: Regex? = nil
        ) {
            self.title = title
            self.placeholder = placeholder
            self.type = type
            self.unit = unit
            self.description = description
            self.isSecured = isSecured
            self.isRulesEnabled = isRulesEnabled
            self.regex = regex
        }
    }
}

// MARK: - Preview
#Preview {
    VStack(spacing: 32) {
        TextFieldView(
            text: .constant(""),
            config: .init(
                title: "Preview",
                unit: "KM"
            )
        )
        
        TextFieldView(
            text: .constant(""),
            config: .init(
                title: "Preview Secured",
                description: "Must include number(s), one symbol(s), letters and 8 characters",
                isSecured: true
            )
        )
        
        TextFieldView(
            text: .constant(""),
            config: .init(
                title: "Preview Secured",
                description: "Must include number(s), one symbol(s), letters and 8 characters",
                isSecured: true,
                isRulesEnabled: true
            )
        )
    }
    .padding()
}
