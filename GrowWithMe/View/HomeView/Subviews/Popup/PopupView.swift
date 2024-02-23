//
//  PopupView.swift
//  GrowWithMe
//
//  Created by Ahmet Ali ÇETİN on 22.02.2024.
//

import SwiftUI

struct PopupView: View {
    @Binding var isShowingPopup: Bool
    
    var title: String
    var subtitle: String
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "info.circle.fill")
                    .resizable()
                    .frame(width: 30, height: 30, alignment: .center)
                    .foregroundStyle(.orange)
                Text(title)
                    .font(.title3).bold()
            }
            Text(subtitle)
                .font(.footnote)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .multilineTextAlignment(.center)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .foregroundStyle(Color("grayColor"))
                .padding(.leading, 10)
                .padding(.trailing, 10)
        )
    }
}

#Preview {
    PopupView(isShowingPopup: .constant(true), title: "Popup", subtitle: "Popup subtitle Popup subtitle Popup subtitle Popup subtitle Popup subtitle.")
        .previewLayout(.sizeThatFits)
}
