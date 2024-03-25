//
//  PaywallPaymentMethodWantedMost.swift
//  GrowWithMe
//
//  Created by Ahmet Ali ÇETİN on 19.02.2024.
//

import SwiftUI

struct PaywallPaymentMethodWantedMost: View {
    let priceMethod: String
    let price: String
    let oldPrice: String
    let savePercent: String
    let weeklyPrice: String
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(priceMethod)
                            .padding(.leading, 14)
                            .font(.custom("SFProText", size: 14))
                            .fontWeight(.bold)
                        HStack(spacing: 0) {
                            Text(oldPrice)
                                .padding(.leading, 14)
                                .foregroundColor(.secondary)
                                .font(.custom("SFProText", size: 14))
                                .strikethrough()
                                
                            Text(price)
                                .padding(.leading, 14)
                                .font(.custom("SFProText", size: 14))
                                .fontWeight(.bold)
                        }
                    }
                    
                    Spacer()
                    VStack(alignment: .trailing) {
                        HStack {
                            ZStack {
                                
                                Capsule()
                                    .foregroundStyle(Color.orange)
                                    .frame(width: 70, height: 30, alignment: .center)
                                
                                Text(savePercent)
                                    .font(.custom("SFProText", size: 11))
                                    .foregroundStyle(.white)
                                    .fontWeight(.bold)
                                    
                                    
                            }
                            .padding(.trailing, 11)
                            
                        }
                        
                        Text(weeklyPrice)
                            .padding(.trailing, 14)
                            .font(.custom("SFProText", size: 11))
                            .foregroundStyle(.secondary)
                    }
                    
                }
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.orange, lineWidth: 2)
                        .frame(height: 75)
                        
                )
                .padding(14)
                
            }
        }
    }
}


#Preview {
    PaywallPaymentMethodWantedMost(priceMethod: "Weekly", price: "$13.99", oldPrice: "$31.99", savePercent: "100%", weeklyPrice: "$0.31")
}
