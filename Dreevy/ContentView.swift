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
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            
            Image(asset: .iconUser)
            
            Text("Hello, world!")
                .customFont(.Display.ExtraSmall.bold, color: .Base.black)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
