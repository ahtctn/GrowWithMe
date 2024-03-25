//
//  ScreenBackgroundView.swift
//  GrowWithMe
//
//  Created by Ahmet Ali ÇETİN on 25.03.2024.
//

import SwiftUI

struct ScreenBackgroundView: View {
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [Color("darkBlueColor"), Color("lightBlueColor")]), startPoint: .center, endPoint: .top)
            .ignoresSafeArea(.all, edges: .top)
            .padding(.bottom, -100)
        
    }
}

#Preview {
    ScreenBackgroundView()
}
