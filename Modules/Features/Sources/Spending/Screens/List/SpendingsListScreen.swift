//
//  SwiftUIView.swift
//  Features
//
//  Created by Theo Sementa on 15/12/2025.
//

import SwiftUI
import Navigation
import DesignSystem

public struct SpendingsListScreen: View {
    
    // MARK: States
    @State private var viewModel: ViewModel = .init()
    
    // MARK: Init
    public init() { }
    
    // MARK: - View
    public var body: some View {
        VStack(spacing: .zero) {
            NavigationBarView(title: "Car spendings") // TODO: TBL
            
            List {
                Text("Last expenses") // TODO: TBL
                    .customFont(.Display.ExtraSmall.bold, color: .Gray.veryDark)
                    .fullWidth(.leading)
                    .disableRowStyle()
                    .padding(.bottom, .small)
                
                ForEach(viewModel.spendingStore.spendings) { spending in
                    NavigationButtonView(
                        route: .modalFitContent,
                        destination: .spending(.detail(spendingId: spending.id))
                    ) {
                        SpendingRowView(
                            price: spending.amount ?? 0,
                            title: spending.title,
                            subtitle: spending.subtitle,
                            date: spending.date
                        )
                    }
                }
                .disableRowStyle()
                .padding(.vertical, .small)
            }
            .scrollIndicators(.hidden)
            .listStyle(.plain)
            .padding(.horizontal, .large)
            .contentMargins(.vertical, .large, for: .scrollContent)
            
            ActionButtonView(title: "Pagination") {
                await viewModel.fetchSpendings()
            }
        }
        .fullSize()
        .navigationBarBackButtonHidden(true)
        .task {
            viewModel.spendingStore.spendings = []
            await viewModel.fetchSpendings()
        }
    }
}

// MARK: - Preview
#Preview {
    SpendingsListScreen()
}
