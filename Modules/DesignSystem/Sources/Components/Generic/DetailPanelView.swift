//
//  SwiftUIView.swift
//  DesignSystem
//
//  Created by Theo Sementa on 13/12/2025.
//

import SwiftUI
import Models
import Utilities

public struct DetailPanelView: View {

    // MARK: Dependencies
    var title: String
    var style: DetailPanelStyle
    var datas: [BarChartUIModel]
    var bigValue: Double
    var addAction: () -> Void
    var viewMoreAction: () -> Void

    // MARK: Init
    public init(
        title: String,
        style: DetailPanelStyle,
        datas: [BarChartUIModel],
        bigValue: Double,
        addAction: @escaping () -> Void,
        viewMoreAction: @escaping () -> Void
    ) {
        self.title = title
        self.style = style
        self.datas = datas
        self.bigValue = bigValue
        self.addAction = addAction
        self.viewMoreAction = viewMoreAction
    }
    
    // MARK: Computed variables
    var isDataEmpty: Bool {
        return datas.reduce(0) { $0 + $1.value } == 0
    }

    // MARK: -
    public var body: some View {
        VStack(spacing: .large) {
            Text(title)
                .customFont(.Text.Small.medium, color: .Gray.mid)
                .fullWidth(.leading)
            
            VStack(spacing: 32) {
                if !isDataEmpty {
                    VStack(alignment: .leading, spacing: .standard) {
                        labelsView

                        ActionButtonView(
                            title: style.actionButtonTitle,
                            style: .fill
                        ) { addAction() }
                    }
                    .fullWidth(.leading)
                }

                VStack(spacing: .standard) {
                    if isDataEmpty {
                        emptyView
                    } else {
                        GenericBarChartView(data: datas)
                            .frame(height: 200)
                    }
                    
                    ActionButtonView(
                        title: "detail_panel_view_more".localized,
                        isFullWidth: true,
                        style: .secondary
                    ) { viewMoreAction() }
                }
            }
        }
        .padding(.horizontal, .huge)
        .padding(.vertical, .large)
        .roundedBackground(
            color: .Base.white,
            radius: .large,
            strokeColor: .Gray.light
        )
    }
}

// MARK: - Subviews
extension DetailPanelView {
    
    private var labelsView: some View {
        VStack(alignment: .leading, spacing: .tiny) {
            Text("\(bigValue.toString()) \(style == .spending ? UserCurrency.symbol : "")")
                .customFont(.Display.Medium.medium, color: .Gray.veryDark)
                .contentTransition(.numericText())

            let userSymbol = style == .spending ? UserCurrency.symbol : DistanceType.userPreferenceSymbol
            let averageValue = "\(datas.average)\(userSymbol)"
            let extraPerMonth = style == .spending ? "" : "word_per_month".localized
            Text("\(averageValue) \("word_on_average".localized) \(extraPerMonth)")
                .customFont(.Text.Small.medium, color: .Gray.mid)
        }
    }
    
    private var emptyView: some View {
        VStack(spacing: 8) {
            let text = style == .mileage ? "detail_panel_empty_mileage" : "detail_panel_empty_spending"
            
            Text(text.localized)
                .customFont(.Text.Small.bold, color: .Gray.veryDark)
                .multilineTextAlignment(.center)

            ActionButtonView(
                title: style.actionButtonTitle,
                style: .fill
            ) {
                addAction()
            }
        }
        .padding(.vertical, 32)
    }
    
}

// MARK: - Preview
// #Preview {
//    DetailPanel(
//        title: "Expenses this month",
//        style: .spending,
//        datas: BarChartData.mocksLast6Months
//    )
//    .padding()
// }
