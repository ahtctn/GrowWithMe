//
//  AllPaywallPaymentsMethodsView.swift
//  GrowWithMe
//
//  Created by Ahmet Ali ÇETİN on 19.02.2024.
//

import SwiftUI

struct AllPaywallPaymentsMethodsView: View {
    var body: some View {
        VStack(spacing: 16) {
            PaywallPaymentMethodView(priceMethod: "weekly".localized(), price: "$1.99")
            PaywallPaymentMethodView(priceMethod: "monthly".localized(), price: "$4.99")
            PaywallPaymentMethodWantedMost(priceMethod: "yearly".localized(), price: "$15.00", oldPrice: "$30.00", savePercent: "SAVE 90%", weeklyPrice: "$0.31/week")
        }
    }
}

#Preview {
    AllPaywallPaymentsMethodsView()
}
