//
//  SwiftUIView.swift
//  Features
//
//  Created by Theo Sementa on 16/12/2025.
//

import SwiftUI
import Stores
import Models
import Navigation
import DesignSystem
import Preferences
import Utilities

public struct SpendingDetailsScreen: View {
    
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var router: Router<AppDestination>
    
    @State private var viewModel: SpendingDetailsScreen.ViewModel

//    @AppStorage(PreferencesKey.volumeUnit.rawValue) private var volumeUnit: String = ""
    
    public init(spendingId: String) {
        self._viewModel = State(wrappedValue: .init(spendingId: spendingId))
    }

    // MARK: -
    public var body: some View {
        if let spending = viewModel.spending {
            VStack(spacing: 32) {
                VStack(spacing: 24) {
                    VStack(alignment: .leading) {
                        let amountString = spending.amount?.toString() ?? ""
                        Text("\("spending_detail_you".localized) \(amountString) \(UserCurrency.symbol)")
                        
                        if spending.type == .fuel && spending.literQuantity == 0 {

                        } else {
                            Text("\("spending_detail_for".localized) \(spending.title)")
                                .multilineTextAlignment(.leading)
                                .lineLimit(2)
                        }
                    }
                    .customFont(.Display.Medium.bold, color: .Gray.veryDark)
                    .fullWidth(.leading)

                    Text(spending.subtitle)
                        .customFont(.Text.Small.medium, color: .Gray.veryDark)
                        .fullWidth(.leading)

                    detailRowsView(spending: spending)
                }

                VStack(spacing: 8) {
//                    ActionButtonView(
//                        title: <#T##String#>,
//                        icon: <#T##ImageType?#>,
//                        isFullWidth: <#T##Bool#>,
//                        style: <#T##ActionButtonStyle#>
//                    ) {
//                        
//                    }
                    
//                    ActionButtonView(
//                        config: .init(
//                            title: "word_edit".localized,
//                            icon: "iconEdit",
//                            style: .secondary
//                        )
//                    ) {
//                        
//                    }
//
//                    ActionButtonView(
//                        config: .init(
//                            title: "word_delete".localized,
//                            icon: "iconTrash",
//                            style: .destructive
//                        )
//                    ) {
//                        spendingStore.deleteSpending(spending)
//                        dismiss()
//                    }
                }
            }
            .padding(.horizontal, 32)
            .padding(.top, 32)
            .padding(.bottom, 24)
            .background(Color.white)
        }
    }
}

// MARK: - Subviews
extension SpendingDetailsScreen {
    
    private func detailRowsView(spending: SpendingUIModel) -> some View {
        VStack(spacing: 8) {
            DetailRowView(
                text: "word_date".localized,
                value: spending.date.formatted(date: .complete, time: .omitted).capitalized
            )
            
            if let service = spending.service {
                DetailRowView(
                    text: "word_type".localized,
                    value: service.name
                )
            }
            
            if spending.literQuantity != 0 && spending.amount != 0 {
                let pricePerLiter = (spending.amount ?? 0) / (spending.literQuantity ?? 0)
                DetailRowView(
                    text: "word_price_per_liter".localized,
                    value: pricePerLiter.toString() + UserCurrency.symbol + "/" + VolumeType.userPreferenceSymbol
                )
            }
            
//            if spending.recurrence != .none {
//                DetailRowView(
//                    text: "word_recurrence".localized,
//                    value: spending.recurrence.name
//                )
//            }
        }
    }
    
}

// MARK: - Preview
#Preview {
    SpendingDetailsScreen(spendingId: "123")
}
