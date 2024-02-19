//
//  FirstCircleView.swift
//  GrowWithMe
//
//  Created by Ahmet Ali ÇETİN on 19.02.2024.
//

import SwiftUI

struct FirstCircleView: View {
    var body: some View {
        HStack(spacing: -40) {
            Circle()
                .foregroundStyle(.orange)
                .frame(width: 140, height: 140, alignment: .center)
                .opacity(0.2)
                .padding(.leading, 200)
            Circle()
                .frame(width: 160, height: 160, alignment: .center)
                .foregroundStyle(.yellow)
                .opacity(0.4)
                .padding(.trailing, 200)
        }
        .frame(height: 170)
    }
}

#Preview {
    FirstCircleView()
}
