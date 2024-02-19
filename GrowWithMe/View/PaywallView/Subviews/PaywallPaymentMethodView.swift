//
//  PaywallPaymentMethodView.swift
//  GrowWithMe
//
//  Created by Ahmet Ali ÇETİN on 19.02.2024.
//

import SwiftUI

struct PaywallPaymentMethodView: View {
    let priceMethod: String
    let price: String
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text(priceMethod)
                        .padding(.leading, 14)
                    
                        .font(.custom("SFProText", size: 14))
                        .fontWeight(.bold)
                    Spacer()
                    Text(price)
                        .padding(.trailing, 14)
                        .font(.custom("SFProText", size: 14))
                        .foregroundStyle(.secondary)
                }
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.orange, lineWidth: 2)
                        .frame(height: 50)
                )
                .padding(14)
                
            }
        }
    }
}

#Preview {
    PaywallPaymentMethodView(priceMethod: "ljkh", price: "kjh")
}
