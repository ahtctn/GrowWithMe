//
//  PlayButtonView.swift
//  GrowWithMe
//
//  Created by Ahmet Ali ÇETİN on 25.03.2024.
//

import SwiftUI

struct PlayButtonView: View {
    var symbolImage: String
    
    var circleWidth: Double
    var circleHeight: Double
    
    var innerCircleWidth: Double
    var innerCircleHeight: Double
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: circleWidth, height: circleHeight)
                .foregroundColor(Color.orange.opacity(0.5)) // Örneğin mavi bir daire
            
            Image(systemName: symbolImage) // Play simgesi
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: innerCircleWidth, height: innerCircleHeight)
                .foregroundColor(.orange) // Play simgesinin rengi
            
        }
    }
}
#Preview {
    PlayButtonView(symbolImage: "person.fill", circleWidth: 100, circleHeight: 100, innerCircleWidth: 75, innerCircleHeight: 75)
}
