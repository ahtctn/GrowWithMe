//
//  PaywallView.swift
//  GrowWithMe
//
//  Created by Ahmet Ali ÇETİN on 8.02.2024.
//


import SwiftUI

struct PaywallView: View {
    @Binding var isPaywallPresented: Bool
    var body: some View {
        
        VStack(spacing: 20) {
            ZStack {
                
                AnimationView()
                Button {
                   isPaywallPresented = false
                } label: {
                    Image(systemName: "xmark")
                }
                .padding(.leading, -170)
                .padding(.top, -80)
            }
            Text("get_unlimited_access".localized())
                .font(.title).bold()
            
            AllAdvantagesView()
                .padding(.bottom, 20)
            AllPaywallPaymentsMethodsView()
                .frame(width: 390)
            Spacer()
            PaywallContinueButton()
                .frame(width: 390)
            Spacer()
            PaywallTermsButton()
            
        }
    }
}

#Preview {
    PaywallView(isPaywallPresented: .constant(true))
}
