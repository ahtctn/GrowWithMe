//
//  TimerButtonView.swift
//  GrowWithMe
//
//  Created by Ahmet Ali ÇETİN on 25.03.2024.
//

import SwiftUI

struct TimerButtonView: View {
    var imageStyle: String
    var body: some View {
        ZStack {
            Image(systemName: imageStyle)
            // Play simgesi
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
                .foregroundColor(.orange) // Play simgesinin rengi
            
            Circle()
                .foregroundStyle(.orange.opacity(0.5))
                .frame(width: 75, height: 75, alignment: .center)
        }
    }
}

#Preview {
    TimerButtonView(imageStyle: "gece")
}
