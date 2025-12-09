//
//  ContentView.swift
//  Dreevy
//
//  Created by Theo Sementa on 09/12/2025.
//

import SwiftUI
import DesignSystem

struct ContentView: View {
    var body: some View {
        VStack {
            ExpenseRowView(
                price: 180,
                title: "Hello",
                subtitle: "Hello subtitle",
                date: .now
            )
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
