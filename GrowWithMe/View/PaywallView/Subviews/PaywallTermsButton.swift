//
//  PaywallTermsButton.swift
//  GrowWithMe
//
//  Created by Ahmet Ali ÇETİN on 19.02.2024.
//

import SwiftUI

struct PaywallTermsButton: View {
    var body: some View {
        HStack(spacing: 50) {
            Button {
                print("privacy policy button tapped.")
            } label: {
                Text("privacy_policy".localized())
                    .font(.footnote).bold()
            }
            
            Button {
                print("restore policy button tapped")
            } label: {
                Text("restore".localized())
                    .font(.footnote).bold()
            }
            
            Button {
                print("terms of use button tapped")
            } label: {
                Text("terms_of_use".localized())
                    .font(.footnote).bold()
            }
        }
        .padding(.leading, 20)
        .padding(.trailing, 20)
    }
}


#Preview {
    PaywallTermsButton()
}
