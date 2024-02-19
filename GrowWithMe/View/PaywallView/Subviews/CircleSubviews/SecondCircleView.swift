//
//  SecondCircleView.swift
//  GrowWithMe
//
//  Created by Ahmet Ali ÇETİN on 19.02.2024.
//

import SwiftUI

struct SecondCircleView: View {
    var body: some View {
        HStack(alignment: .bottom, spacing: 10) {
            Circle()
                .frame(width: 100, height: 100, alignment: .center)
                .foregroundStyle(.yellow)
                .opacity(0.2)
            
            Circle()
                .frame(width: 140, height: 140)
                .foregroundStyle(.orange)
                .opacity(0.16)
            
            Circle()
                .foregroundStyle(.orange)
                .frame(width: 60, height: 60, alignment: .center)
                
                .opacity(0.4)
        }
        .frame(height: 170)
    }
}

#Preview {
    SecondCircleView()
}
