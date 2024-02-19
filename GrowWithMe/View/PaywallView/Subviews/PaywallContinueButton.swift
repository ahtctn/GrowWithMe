//
//  PaywallContinueButton.swift
//  GrowWithMe
//
//  Created by Ahmet Ali ÇETİN on 19.02.2024.
//

import SwiftUI

struct PaywallContinueButton: View {
    var body: some View {
        Button {
            print("Continue button tapped")
        } label: {
            HStack {
                Spacer()
                Text("continue".localized())
                    .foregroundStyle(.white)
                    .bold()
                Spacer()
            }
            
            .background(
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundStyle(Color.orange)
                        .frame(height: 50)
                        .padding(14)
            )
        }
    }
}

#Preview {
    PaywallContinueButton()
}
