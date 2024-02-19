//
//  ThirdCircleView.swift
//  GrowWithMe
//
//  Created by Ahmet Ali ÇETİN on 19.02.2024.
//

import SwiftUI

struct ThirdCircleView: View {
    var body: some View {
        HStack {
            Circle()
                .frame(width: 130, height: 130, alignment: .center)
                .foregroundStyle(.yellow)
                .opacity(0.2)
            VStack {
                Circle()
                    .frame(width: 100, height: 100, alignment: .center)
                    .foregroundStyle(.orange)
                    .opacity(0.14)
                Circle()
                    .frame(width: 50, height: 50, alignment: .center)
                    .foregroundStyle(.orange)
                    .opacity(0.2)
            }
        }
        .frame(height: 170)
        
    }
}

#Preview {
    ThirdCircleView()
}
